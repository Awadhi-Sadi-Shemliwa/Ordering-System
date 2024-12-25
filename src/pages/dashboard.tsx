import React from 'react';
import Sidebar from '../components/layout/sidebar';
import OrderList from '../components/orders/orderlist';

const Dashboard = () => {
  return (
    <div className="dashboard-container">
      <Sidebar />
      <main className="main-content">
        <h1>Dashboard</h1>
        <OrderList />
      </main>
    </div>
  );
};

export default Dashboard; 