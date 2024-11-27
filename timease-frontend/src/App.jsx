// src/App.jsx
import React from 'react';
import { Outlet } from 'react-router-dom';
import Navbar from './components/Navbar';

const App = () => {
  return (
    <div>
      <Navbar />
      <main>
        <Outlet /> {/* This renders the current route's component */}
      </main>
    </div>
  );
};

export default App;
