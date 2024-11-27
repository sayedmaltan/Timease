import React, { useContext } from 'react';
import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import IconButton from '@mui/material/IconButton';
import MenuIcon from '@mui/icons-material/Menu';
import { Link } from 'react-router-dom';
import AuthContext from '../context/AuthContext';

const Navbar = () => {
  const { user, logout } = useContext(AuthContext);

  return (
    <Box sx={{ flexGrow: 1 }}>
    <AppBar position="static">
      <Toolbar>
        
        <Typography variant="h6" component="div" sx={{ flexGrow: 1 }}>
        <Link to="/">Home</Link>
        </Typography>
        <Box sx={{ display: { xs: 'none', sm: 'block' } }}>
        {user ? (
        <>
          <Link to="/dashboard">Dashboard</Link>
          <button onClick={logout}>Logout</button>
        </>
      ) : (
        <>
          <Link sx={{ color: '#fff' }} to="/login">Login</Link>
          <Link sx={{ color: '#fff' }}to="/signup">Sign Up</Link>
        </>
      )}
                </Box>
      </Toolbar>
    </AppBar>
  </Box>

  )
};

export default Navbar;
