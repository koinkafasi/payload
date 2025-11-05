import React from 'react'
import './globals.css'

export const metadata = {
  title: 'Bitcosar CMS',
  description: 'Payload CMS for bitcosar.com',
}

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>{children}</body>
    </html>
  )
}
