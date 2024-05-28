import axios from "axios";
import React, { useEffect, useState } from "react";
import { MdOutlineAddBox } from "react-icons/md";
import { Link } from "react-router-dom";
import Spinner from "../components/SpinnerComp";

const Home = () => {
  const [books, setBooks] = useState([]);
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    setLoading(true);
    axios
      .get("http://localhost:5555/books")
      .then((response) => {
        setBooks(response.data.data);
        setLoading(false);
      })
      .catch((error) => {
        console.log(error);
        setLoading(false);
      });
  });
  return (
    <div className='p-4'>
        <div className='flex justify-between items-center'>
            <h1 className='text-3xl my-8'>Books List</h1>
            <Link to='/books/create'>
                <MdOutlineAddBox className='text-sky-800 text-4xl' />
            </Link>
        </div>
        {loading ? (
            <Spinner />
        ) : (
          <table className='w-full border-separate border-spacing-2'>
              <thead>
                  <tr>
                      <th className='border border-slate-600 rounded-md'>No</th>
                      <th className='border border-slate-600 rounded-md'>Title</th>
                      <th className='border border-slate-600 rounded-md max-md:hidden'>Author</th>
                      <th className='border border-slate-600 rounded-md max-md:hidden'>Publish Year</th>
                  </tr>
              </thead>
              <tbody>
                  {books.map((book, index) => (
                      <tr key={book.id}>
                          <td className='border border-slate-600 rounded-md'>{index + 1}</td>
                          <td className='border border-slate-600 rounded-md'>{book.title}</td>
                          <td className='border border-slate-600 rounded-md max-md:hidden'>{book.author}</td>
                          <td className='border border-slate-600 rounded-md max-md:hidden'>{book.year}</td>
                      </tr>
                  ))}
              </tbody>
          </table>
      )}
    </div>
);
};

export default Home;
