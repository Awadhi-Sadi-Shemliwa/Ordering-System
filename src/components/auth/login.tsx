import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import { authService } from '../../services/auth';

const Login = () => {
  const [credentials, setCredentials] = useState({ username: '', password: '' });
  const navigate = useNavigate();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    try {
      await authService.login(credentials.username, credentials.password);
      navigate('/dashboard');
    } catch (error) {
      console.error('Login failed:', error);
    }
  };

  return (
    <div className="login-container">
      <form onSubmit={handleSubmit}>
        <h2>Login</h2>
        <input
          type="text"
          placeholder="Username"
          onChange={(e) => setCredentials({...credentials, username: e.target.value})}
        />
        <input
          type="password"
          placeholder="Password"
          onChange={(e) => setCredentials({...credentials, password: e.target.value})}
        />
        <button type="submit">Login</button>
      </form>
    </div>
  );
};

export default Login; 