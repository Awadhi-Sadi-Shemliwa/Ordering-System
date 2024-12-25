import 'package:flutter/material.dart';
import '../models/order.dart';

class OrderCard extends StatelessWidget {
  final Order order;
  final VoidCallback onTap;

  const OrderCard({
    super.key,
    required this.order,
    required this.onTap,
  });

  Color _getStatusColor() {
    switch (order.status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'shipped':
        return Colors.blue;
      case 'delivered':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order #${order.id}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Chip(
                    label: Text(
                      order.status,
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: _getStatusColor(),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Customer: ${order.customerName}',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 4),
              Text(
                'Product: ${order.productName}',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Quantity: ${order.quantity}',
                    style: TextStyle(fontSize: 14),
                  ),
                  Text(
                    '\$${order.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}