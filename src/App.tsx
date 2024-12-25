import React from 'react';
import { BrowserRouter, Routes, Route, Navigate } from 'react-router-dom';
import { AuthProvider } from './context/AuthContext';
import Login from './components/auth/login';
import Dashboard from './pages/dashboard';
import Orders from './pages/orders';
import Users from './pages/users';

// Modified ProtectedRoute that allows access during development
const ProtectedRoute = ({ children }: { children: React.ReactNode }) => {
  // For development, comment out the token check
  // const token = localStorage.getItem('token');
  // if (!token) return <Navigate to="/login" />;
  
  return <>{children}</>;
};

const App: React.FC = () => {
  return (
    <AuthProvider>
      <BrowserRouter>
        <Routes>
          <Route path="/login" element={<Login />} />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/orders" element={<Orders />} />
          <Route path="/users" element={<Users />} />
          <Route path="/" element={<Navigate to="/dashboard" />} />
          {/* Catch all route for 404 */}
          <Route path="*" element={<Navigate to="/dashboard" />} />
        </Routes>
      </BrowserRouter>
    </AuthProvider>
  );
};

export default App;