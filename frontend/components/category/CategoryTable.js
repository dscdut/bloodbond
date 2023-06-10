/* eslint-disable @next/next/no-html-link-for-pages */
import Table from 'rc-table';
import React, { useState } from 'react';
import Pagination from 'react-js-pagination';

const CategoryTable = () => {
	const columns = [
		{
			title: 'Name',
			dataIndex: 'name',
			key: 'name',
			width: 400,
			className: 'text-black p-2 border-r-2 border-b-2',
			rowClassName: 'bg-black-ripon',
		},
		{
			title: 'Blood Volume',
			dataIndex: 'subCount',
			key: 'subCount',
			width: 400,
			className: 'text-black p-2 border-r-2 border-b-2',
		},
		{
			title: 'Physical condition',
			dataIndex: 'productCount',
			key: 'productCount',
			width: 400,
			className: 'text-black p-2 border-r-2 border-b-2',
		},
		{
			title: 'Operations',
			dataIndex: '',
			key: 'operations',
			width: 300,
			className: 'text-black p-2 border-b-2',
			render: () => (
				<>
					<a
						className='bg-red-500 hover:bg-red-400 text-white  py-1 px-3 rounded-full'
						href='/nft/5n4GKcTmZnwMM5BoF5BWrM3CmneP48hMSJrS3ywvNJmC'
					>
						Transfer Certificate
					</a>
				</>
			),
		},
	];

	const data = [
		{
			id: '001',
			name: 'Jack',
			subCount: 300,
			productCount: 'Antithrombin deficiency',
		},
		{
			id: '002',
			name: 'Rose',
			subCount: 250,
			productCount: 'Prothrombin gene mutation',
		},
	];

	//Pagination
	const [activePage, setActivePage] = useState(15);
	const handlePageChange = pageNumber => {
		setActivePage(pageNumber);
	};

	return (
		<>
			<Table
				columns={columns}
				data={data}
				rowKey={data => data.id}
				className='p-4 w-full text-center rc-table-custom font-semibold border-color-black'
				style={{ border: '1px solid #b7b7b8' }}
			/>
			<Pagination
				activePage={activePage}
				itemsCountPerPage={10}
				totalItemsCount={450}
				pageRangeDisplayed={5}
				onChange={handlePageChange}
				nextPageText={'Next'}
				prevPageText={'Prev'}
				firstPageText={'First'}
				lastPageText={'Last'}
				innerClass='js-ul'
				itemClass='js-li'
				linkClass='page-link'
			/>
		</>
	);
};

export default CategoryTable;
