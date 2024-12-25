import React from 'react';
import Sidebar from '../components/layout/sidebar';

const Users = () => {
  return (
    <div className="dashboard-container">
      <Sidebar />
      <main className="main-content">
        <h1>Users Management</h1>
        {/* Add user management functionality here */}
      </main>
    </div>
  );
};

export default Users; 