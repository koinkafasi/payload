import React from 'react'
import Link from 'next/link'

export default function Home() {
  return (
    <main style={{
      padding: '4rem 2rem',
      maxWidth: '800px',
      margin: '0 auto',
      textAlign: 'center'
    }}>
      <h1 style={{ fontSize: '3rem', marginBottom: '1rem' }}>Bitcosar CMS</h1>
      <p style={{ fontSize: '1.2rem', color: '#666', marginBottom: '2rem' }}>
        Payload CMS is running successfully!
      </p>
      <Link
        href="/admin"
        style={{
          display: 'inline-block',
          padding: '1rem 2rem',
          backgroundColor: '#0070f3',
          color: 'white',
          textDecoration: 'none',
          borderRadius: '8px',
          fontSize: '1.1rem',
          fontWeight: '500'
        }}
      >
        Go to Admin Panel →
      </Link>
    </main>
  )
}
