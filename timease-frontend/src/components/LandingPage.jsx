// src/components/LandingPage.jsx
import { Link } from 'react-router-dom';
import React, { useContext } from 'react';
import AuthContext from '../context/AuthContext';

const LandingPage = () => {
  const { user } = useContext(AuthContext);

  return(
  
  <div>
    <h1>Welcome to Timease</h1>
    <p>Your professional scheduling assistant.</p>
   
   

    <div>
  {!user ? (
    <>
      <Link to="/login">Login</Link> | <Link to="/signup">Sign Up</Link>
    </>
  ) : null}
</div>

  </div>
);
}

export default LandingPage;
