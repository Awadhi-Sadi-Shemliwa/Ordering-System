import 'package:flutter/material.dart';
import 'pages/landing_page.dart'; // Import your new pages
import 'pages/signup_page.dart'; // Import the sign-up page
import 'screens/cart_screen.dart'; // Change to cart_screen.dart
import 'pages/login_page.dart'; // Import the login page
import 'screens/order_list_screen.dart'; // Import the old screens
import 'screens/track_browse_orders.dart'; // Import the track and browse orders screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ordering System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      initialRoute: '/signup', // Set the initial route to the SignUpPage
      routes: {
        '/': (context) => LandingPage(), // New orders page
        '/signup': (context) => SignUpPage(), // New sign-up page
        '/cart': (context) => CartScreen(), // Point to cart_screen.dart
        '/login': (context) => LoginPage(), // New login page
        '/orders': (context) => OrderListScreen(), // Old order list screen
        '/track': (context) => TrackBrowseOrders(), // Old track and browse orders screen
      },
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}