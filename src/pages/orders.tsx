import React from 'react';
import Sidebar from '../components/layout/sidebar';
import OrderList from '../components/orders/orderlist';
import OrderForm from '../components/orders/orderform';

const Orders = () => {
  return (
    <div className="dashboard-container">
      <Sidebar />
      <main className="main-content">
        <h1>Orders Management</h1>
        <OrderForm onOrderCreated={() => {}} />
        <OrderList />
      </main>
    </div>
  );
};

export default Orders; 