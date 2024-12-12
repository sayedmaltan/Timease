// auth.js
import axios from 'axios';

const API_BASE_URL = 'http://localhost:8080/api/v1/auth';

export const signup = (data) => axios.post(`${API_BASE_URL}/signup`, data);

export const login = (data) => axios.post(`${API_BASE_URL}/login`, data);

export const logout = (data) =>
  axios.post(`${API_BASE_URL}/logout`, data, {
    headers: {
      'Content-Type': 'application/json',
    },
  });

export const refreshToken = (data) => axios.post(`${API_BASE_URL}/refresh-token`, data);
