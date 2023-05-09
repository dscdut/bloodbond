import { Inter  } from 'next/font/google'

import './globals.css'
import Navbar from './components/NavBar/Navbar';

export const metadata = {
  title: 'BloodBond',
  description: 'Application for blood donor',
}
const font = Inter({
  subsets:["latin"],
});

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={font.className}>
        <Navbar/>
        {children}
      </body>
    </html>
  )
}
