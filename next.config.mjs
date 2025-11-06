import { withPayload } from '@payloadcms/next/withPayload'

/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    reactCompiler: false,
  },
  output: 'standalone',
  // Disable static optimization to avoid Html import issues
  generateBuildId: async () => {
    return 'build-' + Date.now()
  },
  // Skip trailing slash redirect
  skipTrailingSlashRedirect: true,
}

export default withPayload(nextConfig)
