import React, { useState } from "react";
import Modal from "../common/Modal";

const CategoryTitle = () => {
  const [modal, setModal] = useState(false);
  return (
    <>
      <div className="mr-6">
        <h1 className="text-4xl font-semibold mb-2">Category</h1>
        <h2 className="text-gray-600 ml-0.5">List, view and edit</h2>
      </div>

      <div className="flex flex-wrap items-start justify-end -mb-3">
        <button
          className="inline-flex px-5 py-3 text-white bg-red-600 hover:bg-red-700 focus:bg-red-700 rounded-md ml-6 mb-3"
          onClick={() => setModal(true)}
        >
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
          Create new Category
        </button>
        <Modal modal={modal} setModal={setModal} />
      </div>
    </>
  );
};

export default CategoryTitle;
