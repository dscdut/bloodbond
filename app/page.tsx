import Image from 'next/image'
import { Inter } from 'next/font/google'
import styles from './page.module.css'

const inter = Inter({ subsets: ['latin'] })

export default function Home() {
  return (
    <div className='text-5xl text-yellow-300'>
      <div></div>
    </div>
  )
}
