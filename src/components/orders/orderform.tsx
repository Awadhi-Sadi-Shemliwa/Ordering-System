import React, { useState } from 'react';
import { orderService } from '../../services/api';
import '../../styles/orderform.css';

interface OrderFormData {
  customerName: string;
  productName: string;
  quantity: number;
  price: number;
  status: string;
}
const OrderForm = ({ onOrderCreated }: { onOrderCreated: () => void }) => {
  const [formData, setFormData] = useState({
    customerName: '',
    productName: '',
    quantity: 0,
    price: 0,
    status: 'pending'
  });
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError('');

    try {
      await orderService.createOrder(formData);
      onOrderCreated();
      setFormData({
        customerName: '',
        productName: '',
        quantity: 0,
        price: 0,
        status: 'pending'
      });
    } catch (err) {
      setError('Failed to create order');
    } finally {
      setLoading(false);
    }
  };

  return (
    <form onSubmit={handleSubmit} className="order-form">
      {error && <div className="error-message">{error}</div>}
      <div className="form-group">
        <label>Customer Name:</label>
        <input
          type="text"
          value={formData.customerName}
          onChange={(e) => setFormData({...formData, customerName: e.target.value})}
          required
        />
      </div>
      <div className="form-group">
        <label>Product Name:</label>
        <input
          type="text"
          value={formData.productName}
          onChange={(e) => setFormData({...formData, productName: e.target.value})}
          required
        />
      </div>
      <div className="form-group">
        <label>Quantity:</label>
        <input
          type="number"
          value={formData.quantity}
          onChange={(e) => setFormData({...formData, quantity: parseInt(e.target.value)})}
          required
        />
      </div>
      <div className="form-group">
        <label>Price:</label>
        <input
          type="number"
          value={formData.price}
          onChange={(e) => setFormData({...formData, price: parseFloat(e.target.value)})}
          required
        />
      </div>
      <div className="form-group">
        <label>Status:</label>
        <select
          value={formData.status}
          onChange={(e) => setFormData({...formData, status: e.target.value})}
        >
          <option value="pending">Pending</option>
          <option value="shipped">Shipped</option>
          <option value="delivered">Delivered</option>
        </select>
      </div>
      <button type="submit" disabled={loading}>
        {loading ? 'Creating...' : 'Create Order'}
      </button>
    </form>
  );
};

export default OrderForm; 