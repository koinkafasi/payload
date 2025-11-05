# Payload CMS - bitcosar.com

Minimal Payload 3.0 CMS setup with MongoDB and Next.js.

## Environment Variables

Required environment variables in Coolify:

```bash
DATABASE_URI=mongodb://root:password@host:27017/payload?authSource=admin
PAYLOAD_SECRET=your-secret-key
PAYLOAD_PUBLIC_SERVER_URL=https://bitcosar.com
NODE_ENV=production
PORT=3000
NODE_OPTIONS=--max-old-space-size=4096
```

## Development

```bash
pnpm install
pnpm run dev
```

## Production Build

```bash
pnpm run build
pnpm run serve
```

## Deployment on Coolify

This project includes a multi-stage Dockerfile optimized for Payload CMS v3:

1. **deps stage**: Installs dependencies with pnpm
2. **builder stage**: Builds the Next.js application
3. **runner stage**: Production runtime with minimal footprint

### Memory Configuration

- Swap: 4GB enabled on server
- NODE_OPTIONS: --max-old-space-size=4096
- Docker memory limit: 4GB recommended

## Features

- ✅ Payload CMS 3.0
- ✅ Next.js 15
- ✅ MongoDB database
- ✅ Lexical rich text editor
- ✅ User authentication
- ✅ Media uploads
- ✅ TypeScript
- ✅ Optimized Docker build

## Admin Panel

After deployment, access the admin panel at:
- https://bitcosar.com/admin

Create your first user on initial visit.
