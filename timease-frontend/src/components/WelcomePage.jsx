import React, { useContext } from 'react';
import AuthContext from '../context/AuthContext';

const WelcomePage = () => {
  const { user } = useContext(AuthContext);
  console.log("user : ",user)
  return (
    <div>
      <h1>Welcome, {user ? user.email : 'Guest'}!</h1>
    </div>
  );
};

export default WelcomePage;
