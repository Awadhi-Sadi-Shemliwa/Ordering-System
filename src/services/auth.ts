import axios from 'axios';

const AUTH_BASE_URL = 'http://localhost:3000/api';

export const authService = {
  login: async (username: string, password: string) => {
    const response = await axios.post(`${AUTH_BASE_URL}/login`, {
      username,
      password,
    });
    if (response.data.token) {
      localStorage.setItem('token', response.data.token);
    }
    return response.data;
  },

  logout: () => {
    localStorage.removeItem('token');
  },

  register: async (userData: any) => {
    return axios.post(`${AUTH_BASE_URL}/register`, userData);
  },
}; 