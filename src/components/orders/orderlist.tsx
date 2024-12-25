import React, { useEffect, useState } from 'react';
import { orderService } from '../../services/api';

interface Order {
  id: string;
  customerName: string;
  productName: string;
  quantity: number;
  price: number;
  status: string;
}

const OrderList = () => {
  const [orders, setOrders] = useState<Order[]>([]);

  useEffect(() => {
    loadOrders();
  }, []);

  const loadOrders = async () => {
    try {
      const response = await orderService.getOrders();
      setOrders(response.data);
    } catch (error) {
      console.error('Failed to load orders:', error);
    }
  };

  const handleDelete = async (id: string) => {
    try {
      await orderService.deleteOrder(id);
      loadOrders();
    } catch (error) {
      console.error('Failed to delete order:', error);
    }
  };

  return (
    <div className="order-list">
      <table>
        <thead>
          <tr>
            <th>Order ID</th>
            <th>Customer</th>
            <th>Product</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          {orders.map((order) => (
            <tr key={order.id}>
              <td>{order.id}</td>
              <td>{order.customerName}</td>
              <td>{order.productName}</td>
              <td>{order.quantity}</td>
              <td>${order.price}</td>
              <td>{order.status}</td>
              <td>
                <button onClick={() => handleDelete(order.id)}>Delete</button>
              </td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  );
};

export default OrderList; 