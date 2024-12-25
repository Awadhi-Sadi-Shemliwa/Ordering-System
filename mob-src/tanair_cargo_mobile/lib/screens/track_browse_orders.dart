import 'package:flutter/material.dart';
import 'order_list_screen.dart'; // Import the order list screen

class TrackBrowseOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Track and Browse your orders'),
        actions: [
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              // Handle menu action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(child: Text('Filter Orders')),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to Order List Screen
                Navigator.pushNamed(context, '/orders');
              },
              child: Text('View Order List'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to Cart Screen
                Navigator.pushNamed(context, '/cart'); // Use named route
              },
              child: Text('Go to Cart'),
            ),
            SizedBox(height: 16),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(4, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        'Order ${index + 1}',
                        style: TextStyle(color: Colors.black54),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}