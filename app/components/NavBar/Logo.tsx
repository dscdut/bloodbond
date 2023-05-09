import Image from 'next/image'
import React from 'react'

const Logo = () => {
  return (
    <Image
      className="hidden md:block cursor-pointer" 
      src="/images/logo.jpg" 
      height="50" 
      width="50" 
      alt="Logo" 
    />
  )
}

export default Logo