import React, { useRef } from 'react';
import OutsideClick from '../../utils/outsideClick';
import Nav from './sidebar/Nav';
import SettingButton from './sidebar/SettingButton';
import Logo from './sidebar/logo';
import Link from 'next/link';

const Sidebar = ({mobileNavsidebar}) => {
    const sidebarRef = useRef(null);
    const sidebarOutsideClick = OutsideClick(sidebarRef);

    //console.log("sidebar Ref", sidebarRef)
    //console.log("sidebar Ref sidebarOutsideClick", sidebarOutsideClick)
    return (
			<aside
				className={`${
					mobileNavsidebar ? 'block' : 'hidden'
				} sm:flex sm:flex-col z-50`}
				ref={sidebarRef}
			>
				<Link href="/">
					<span className="inline-flex items-center justify-center h-20 w-full bg-red-500 hover:bg-red-400 focus:bg-red-500 cursor-pointer">
						<svg fill="none" viewBox="0 0 64 64" className="h-12 w-14">
							<title>Company logo</title>
							<path
								d="M32 14.2c-8 0-12.9 4-14.9 11.9 3-4 6.4-5.6 10.4-4.5 2.3.6 4 2.3 5.7 4 2.9 3 6.3 6.4 13.7 6.4 7.9 0 12.9-4 14.8-11.9-3 4-6.4 5.5-10.3 4.4-2.3-.5-4-2.2-5.7-4-3-3-6.3-6.3-13.7-6.3zM17.1 32C9.2 32 4.2 36 2.3 43.9c3-4 6.4-5.5 10.3-4.4 2.3.5 4 2.2 5.7 4 3 3 6.3 6.3 13.7 6.3 8 0 12.9-4 14.9-11.9-3 4-6.4 5.6-10.4 4.5-2.3-.6-4-2.3-5.7-4-2.9-3-6.3-6.4-13.7-6.4z"
								fill="#fff"
							/>
						</svg>
					</span>
				</Link>

				<div className="flex-grow flex flex-col justify-between text-gray-500 bg-gray-800">
					<Nav sidebarOutsideClick={sidebarOutsideClick} />
					<SettingButton />
				</div>
			</aside>
		);
};

export default Sidebar;