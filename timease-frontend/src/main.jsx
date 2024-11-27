import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import ReactDOM from 'react-dom/client';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import App from './App';
import { AuthProvider } from './context/AuthContext';
import LandingPage from './components/LandingPage';
import LoginForm from './components/LoginForm';
import SignupForm from './components/SignupForm';
import WelcomePage from './components/WelcomePage';


createRoot(document.getElementById('root')).render(
  <StrictMode>
 <AuthProvider>
      <BrowserRouter>
        <Routes>
          <Route path="/" element={<App />}>
       
            <Route index element={<LandingPage />} />
            <Route path="login" element={<LoginForm />} />
            <Route path="signup" element={<SignupForm />} />
            <Route path="dashboard" element={<WelcomePage />} />
          </Route>
        </Routes>
      </BrowserRouter>
    </AuthProvider>
    
    </StrictMode>,
)
