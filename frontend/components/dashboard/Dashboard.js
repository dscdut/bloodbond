import React from 'react';

const Dashboard = () => {
    return (
			<>
				<main className="p-6 sm:p-10 space-y-6">
					<div className="flex flex-col space-y-6 md:space-y-0 md:flex-row justify-between">
						<div className="mr-6">
							<h1 className="text-4xl font-semibold mb-2">Dashboard</h1>
							<h2 className="text-gray-600 ml-0.5">
								Manage blood donation status for the organization
							</h2>
						</div>
						<div className="flex flex-wrap items-start justify-end -mb-3">
							<button className="inline-flex px-5 py-3 text-red-600 hover:text-red-700 focus:text-red-700 hover:bg-red-100 focus:bg-red-100 border border-red-600 rounded-md mb-3">
								<svg
									aria-hidden="true"
									fill="none"
									viewBox="0 0 24 24"
									stroke="currentColor"
									className="flex-shrink-0 h-5 w-5 -ml-1 mt-0.5 mr-2"
								>
									<path
										strokeLinecap="round"
										strokeLinejoin="round"
										strokeWidth={2}
										d="M15.232 5.232l3.536 3.536m-2.036-5.036a2.5 2.5 0 113.536 3.536L6.5 21.036H3v-3.572L16.732 3.732z"
									/>
								</svg>
								Manage dashboard
							</button>
							<button className="inline-flex px-5 py-3 text-white bg-red-600 hover:bg-red-700 focus:bg-red-700 rounded-md ml-6 mb-3">
								<svg
									aria-hidden="true"
									fill="none"
									viewBox="0 0 24 24"
									stroke="currentColor"
									className="flex-shrink-0 h-6 w-6 text-white -ml-1 mr-2"
								>
									<path
										strokeLinecap="round"
										strokeLinejoin="round"
										strokeWidth={2}
										d="M12 6v6m0 0v6m0-6h6m-6 0H6"
									/>
								</svg>
								Create new dashboard
							</button>
						</div>
					</div>
					<section className="grid md:grid-cols-2 xl:grid-cols-4 gap-6">
						<div className="flex items-center p-8 bg-white shadow rounded-lg">
							<div className="inline-flex flex-shrink-0 items-center justify-center h-16 w-16 text-red-600 bg-red-100 rounded-full mr-6">
								<svg
									aria-hidden="true"
									fill="none"
									viewBox="0 0 24 24"
									stroke="currentColor"
									className="h-6 w-6"
								>
									<path
										strokeLinecap="round"
										strokeLinejoin="round"
										strokeWidth={2}
										d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20H2v-2a3 3 0 015.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z"
									/>
								</svg>
							</div>
							<div>
								<span className="block text-2xl font-bold">62</span>
								<span className="block text-gray-500">Blood donors</span>
							</div>
						</div>
						<div className="flex items-center p-8 bg-white shadow rounded-lg">
							<div className="inline-flex flex-shrink-0 items-center justify-center h-16 w-16 text-green-600 bg-green-100 rounded-full mr-6">
								<svg
									aria-hidden="true"
									fill="none"
									viewBox="0 0 24 24"
									stroke="currentColor"
									className="h-6 w-6"
								>
									<path
										strokeLinecap="round"
										strokeLinejoin="round"
										strokeWidth={2}
										d="M13 7h8m0 0v8m0-8l-8 8-4-4-6 6"
									/>
								</svg>
							</div>
							<div>
								<span className="block text-2xl font-bold">6.8%</span>
								<span className="block text-gray-500">
									Growth blood donation
								</span>
							</div>
						</div>
						<div className="flex items-center p-8 bg-white shadow rounded-lg">
							<div className="inline-flex flex-shrink-0 items-center justify-center h-16 w-16 text-red-600 bg-red-100 rounded-full mr-6">
								<svg
									viewBox="0 0 32 32"
									xmlns="http://www.w3.org/2000/svg"
									fill="#000000"
								>
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g
										id="SVGRepo_tracerCarrier"
										stroke-linecap="round"
										stroke-linejoin="round"
									></g>
									<g id="SVGRepo_iconCarrier">
										{' '}
										<g fill="none">
											{' '}
											<circle
												fill="#00E6A0"
												cx="16"
												cy="16"
												r="16"
											></circle>{' '}
											<path
												d="M23.073 7.5a.653.653 0 01.477.192l-.006-.006a.65.65 0 01.184.364l.009.104-.007 3.417c0 .449-.178.88-.496 1.197l-4.24 4.227 4.537 4.523a1.689 1.689 0 11-2.383 2.394l-5.735-5.717a1.686 1.686 0 010-2.395l5.022-5.012h-8.498v11.889a1.69 1.69 0 01-1.718 1.718l-.17-.006A1.696 1.696 0 018.5 22.677V9.347c0-1.066.763-1.847 1.796-1.847z"
												fill="#FFF"
											></path>{' '}
										</g>{' '}
									</g>
								</svg>
							</div>
							<div>
								<span className="inline-block text-2xl font-bold">32</span>
								<span className="inline-block text-xl text-gray-500 font-semibold">
									(14%)
								</span>
								<span className="block text-gray-500">Number of requests</span>
							</div>
						</div>
						<div className="flex items-center p-8 bg-white shadow rounded-lg">
							<div className="inline-flex flex-shrink-0 items-center justify-center h-16 w-16 text-blue-600 bg-blue-100 rounded-full mr-6">
								<svg
									viewBox="0 0 32 32"
									xmlns="http://www.w3.org/2000/svg"
									fill="#000000"
								>
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g
										id="SVGRepo_tracerCarrier"
										stroke-linecap="round"
										stroke-linejoin="round"
									></g>
									<g id="SVGRepo_iconCarrier">
										{' '}
										<defs>
											{' '}
											<style></style>{' '}
										</defs>{' '}
										<title></title>{' '}
										<g data-name="Layer 14" id="Layer_14">
											{' '}
											<polygon
												class="cls-1"
												points="8 20 24 15 24 20 20 24 12 24 8 20"
											></polygon>{' '}
											<path d="M24,2H8L7,3V19.63l.24.64L11,24.65l.76.35H12v1l1,1h2v3h2V27h2l1-1V25h.29l.76-.35,3.71-4.38.24-.64V3ZM23,8v2H21v2h2v2H21v2h2v3.26L19.82,23H12.18L9,19.26V4H23V6H21V8Z"></path>{' '}
											<path d="M15.22,9.4c-.66.88-3.87,5.39-2.57,8C13,18.12,13.89,19,16,19s3-.9,3.4-1.65c1.31-2.61-1.88-7.08-2.53-8Zm2.34,7c-.22.46-1,.55-1.61.55s-1.3-.09-1.52-.51c-.44-.88.53-3,1.59-4.72C17.07,13.45,18,15.56,17.56,16.45Z"></path>{' '}
										</g>{' '}
									</g>
								</svg>
							</div>
							<div>
								<span className="block text-2xl font-bold">83%</span>
								<span className="block text-gray-500">Finished donations</span>
							</div>
						</div>
					</section>
					<section className="grid md:grid-cols-2 xl:grid-cols-4 xl:grid-rows-3 xl:grid-flow-col gap-6">
						<div className="flex flex-col md:col-span-2 md:row-span-2 bg-white shadow rounded-lg">
							<div className="px-6 py-5 font-semibold border-b border-gray-100">
								The number of requests and donations per month
							</div>
							<div className="p-4 flex-grow">
								<div className="flex items-center justify-center h-full px-4 py-16 text-gray-400 text-3xl font-semibold bg-gray-100 border-2 border-gray-200 border-dashed rounded-md">
									Chart
								</div>
							</div>
						</div>
						<div className="flex items-center p-8 bg-white shadow rounded-lg">
							<div className="inline-flex flex-shrink-0 items-center justify-center h-16 w-16 text-yellow-600 bg-yellow-100 rounded-full mr-6">
								<svg
									viewBox="0 0 16 16"
									xmlns="http://www.w3.org/2000/svg"
									fill="#000000"
								>
									<g id="SVGRepo_bgCarrier" stroke-width="0"></g>
									<g
										id="SVGRepo_tracerCarrier"
										stroke-linecap="round"
										stroke-linejoin="round"
									></g>
									<g id="SVGRepo_iconCarrier">
										{' '}
										<path
											class="warning"
											d="M8 0L5.69 1.65l-2.833.221-.709 2.75-2.027 1.99 1.225 2.563L1.072 12l2.586 1.176 1.606 2.342L8 14.758l2.736.76 1.606-2.342L14.928 12l-.274-2.826L15.88 6.61l-2.027-1.99-.71-2.75-2.831-.22zM7 4h2v3l-.5 2h-1L7 7zm1 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"
											color="#000000"
											font-weight="400"
											font-family="sans-serif"
											white-space="normal"
											overflow="visible"
											fill="#fdc92b"
										></path>{' '}
									</g>
								</svg>
							</div>
							<div>
								<span className="block text-2xl font-bold">25</span>
								<span className="block text-gray-500">Urgent request</span>
							</div>
						</div>
						<div className="flex items-center p-8 bg-white shadow rounded-lg">
							<div className="inline-flex flex-shrink-0 items-center justify-center h-16 w-16 text-teal-600 bg-teal-100 rounded-full mr-6">
								<svg
									aria-hidden="true"
									fill="none"
									viewBox="0 0 24 24"
									stroke="currentColor"
									className="h-6 w-6"
								>
									<path
										strokeLinecap="round"
										strokeLinejoin="round"
										strokeWidth={2}
										d="M12 8v4l3 3m6-3a9 9 0 11-18 0 9 9 0 0118 0z"
									/>
								</svg>
							</div>
							<div>
								<span className="block text-2xl font-bold">139</span>
								<span className="block text-gray-500">Current blood bag</span>
							</div>
						</div>

						<div className="row-span-3 bg-white shadow rounded-lg">
							<div className="flex items-center justify-between px-6 py-5 font-semibold border-b border-gray-100">
								<span>Honoring blood donors</span>
								<button
									type="button"
									className="inline-flex justify-center rounded-md px-1 -mr-1 bg-white text-sm leading-5 font-medium text-gray-500 hover:text-gray-600"
									id="options-menu"
									aria-haspopup="true"
									aria-expanded="true"
								>
									Descending
									<svg
										className="-mr-1 ml-1 h-5 w-5"
										xmlns="http://www.w3.org/2000/svg"
										viewBox="0 0 20 20"
										fill="currentColor"
									>
										<path
											fillRule="evenodd"
											d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
											clipRule="evenodd"
										/>
									</svg>
								</button>
								{/* Refer here for full dropdown menu code: https://tailwindui.com/components/application-ui/elements/dropdowns */}
							</div>
							<div className="overflow-y-auto" style={{ maxHeight: '24rem' }}>
								<ul className="p-6 space-y-6">
									<li className="flex items-center">
										<div className="h-10 w-10 mr-3 bg-gray-100 rounded-full overflow-hidden">
											<img
												src="https://randomuser.me/api/portraits/women/82.jpg"
												alt="Annette Watson profile picture"
											/>
										</div>
										<span className="text-gray-600">Annette Watson</span>
										<span className="ml-auto font-semibold">1300cc</span>
									</li>
									<li className="flex items-center">
										<div className="h-10 w-10 mr-3 bg-gray-100 rounded-full overflow-hidden">
											<img
												src="https://randomuser.me/api/portraits/men/81.jpg"
												alt="Calvin Steward profile picture"
											/>
										</div>
										<span className="text-gray-600">Calvin Steward</span>
										<span className="ml-auto font-semibold">1100cc</span>
									</li>
									<li className="flex items-center">
										<div className="h-10 w-10 mr-3 bg-gray-100 rounded-full overflow-hidden">
											<img
												src="https://randomuser.me/api/portraits/men/80.jpg"
												alt="Ralph Richards profile picture"
											/>
										</div>
										<span className="text-gray-600">Ralph Richards</span>
										<span className="ml-auto font-semibold">850cc</span>
									</li>
									<li className="flex items-center">
										<div className="h-10 w-10 mr-3 bg-gray-100 rounded-full overflow-hidden">
											<img
												src="https://randomuser.me/api/portraits/men/79.jpg"
												alt="Bernard Murphy profile picture"
											/>
										</div>
										<span className="text-gray-600">Bernard Murphy</span>
										<span className="ml-auto font-semibold">500cc</span>
									</li>
									<li className="flex items-center">
										<div className="h-10 w-10 mr-3 bg-gray-100 rounded-full overflow-hidden">
											<img
												src="https://randomuser.me/api/portraits/women/78.jpg"
												alt="Arlene Robertson profile picture"
											/>
										</div>
										<span className="text-gray-600">Arlene Robertson</span>
										<span className="ml-auto font-semibold">300cc</span>
									</li>
									<li className="flex items-center">
										<div className="h-10 w-10 mr-3 bg-gray-100 rounded-full overflow-hidden">
											<img
												src="https://randomuser.me/api/portraits/women/77.jpg"
												alt="Jane Lane profile picture"
											/>
										</div>
										<span className="text-gray-600">Jane Lane</span>
										<span className="ml-auto font-semibold">300cc</span>
									</li>
									<li className="flex items-center">
										<div className="h-10 w-10 mr-3 bg-gray-100 rounded-full overflow-hidden">
											<img
												src="https://randomuser.me/api/portraits/men/76.jpg"
												alt="Pat Mckinney profile picture"
											/>
										</div>
										<span className="text-gray-600">Pat Mckinney</span>
										<span className="ml-auto font-semibold">250cc</span>
									</li>
									<li className="flex items-center">
										<div className="h-10 w-10 mr-3 bg-gray-100 rounded-full overflow-hidden">
											<img
												src="https://randomuser.me/api/portraits/men/75.jpg"
												alt="Norman Walters profile picture"
											/>
										</div>
										<span className="text-gray-600">Norman Walters</span>
										<span className="ml-auto font-semibold">250cc</span>
									</li>
								</ul>
							</div>
						</div>
						<div className="flex flex-col row-span-3 bg-white shadow rounded-lg">
							<div className="px-6 py-5 font-semibold border-b border-gray-100">
								People who are willing to donate blood
							</div>
							<div className="p-4 flex-grow">
								<div className="flex items-center justify-center h-full px-4 py-24 text-gray-400 text-3xl font-semibold bg-gray-100 border-2 border-gray-200 border-dashed rounded-md">
									Chart
								</div>
							</div>
						</div>
					</section>
				</main>
			</>
		);
};

export default Dashboard;