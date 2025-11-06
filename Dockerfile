# Base image with Node.js
FROM node:20-bookworm-slim AS base

# Install dependencies
FROM base AS deps
WORKDIR /app
ENV PNPM_HOME="/root/.local/share/pnpm"
ENV PATH="$PNPM_HOME:$PATH"

# Copy package files and .npmrc for script configuration
COPY package.json pnpm-lock.yaml .npmrc ./
COPY yarn.lock* package-lock.json* ./

# Enable pnpm and allow build scripts
RUN corepack enable pnpm \
 && pnpm config set allow-scripts true \
 && pnpm config set enable-pre-post-scripts true \
 && pnpm i --frozen-lockfile --ignore-scripts=false \
 && pnpm rebuild sharp esbuild

# Build the Next.js application
FROM base AS builder
WORKDIR /app
ENV NODE_ENV=development
COPY --from=deps /app/node_modules ./node_modules
COPY . .
ENV NEXT_TELEMETRY_DISABLED=1
RUN corepack enable pnpm && pnpm run build

# Final stage: Set up the runtime environment
FROM base AS runner
WORKDIR /app
ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
ENV PORT=3000
ENV HOSTNAME=0.0.0.0

# Create and set the application user
RUN groupadd -g 1001 nodejs && useradd -u 1001 -g nodejs -M nextjs

# Copy the built files from the builder stage
COPY --from=builder /app/public ./public

# Setup directories and permissions for runtime
RUN mkdir .next && chown -R nextjs:nodejs .next public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

# Switch to non-root user
USER nextjs

# Expose the port the app runs on
EXPOSE 3000

# Command to run the application
CMD ["node", "server.js"]
