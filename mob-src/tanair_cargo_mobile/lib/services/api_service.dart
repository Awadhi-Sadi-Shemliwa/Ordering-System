// import 'dart:convert';
// import 'package:http/http.dart' as http;
import '../models/order.dart';

class ApiService {
  // Update this to match your web dashboard's API URL
  // final String baseUrl = 'http://localhost:3000/api'; // or your deployed URL
  
  Future<List<Order>> getOrders({String? searchQuery, String? status}) async {
    // Simulate API delay
    await Future.delayed(Duration(seconds: 1));
    
    // Mock data
    final mockOrders = [
      Order(
        id: "ORD001",
        customerName: "John Doe",
        productName: "Laptop",
        quantity: 1,
        price: 999.99,
        status: "pending"
      ),
      Order(
        id: "ORD002",
        customerName: "Jane Smith",
        productName: "Smartphone",
        quantity: 2,
        price: 799.99,
        status: "shipped"
      ),
      // Add more mock orders as needed
    ];

    // Filter by status if provided
    var filteredOrders = mockOrders;
    if (status != null && status.isNotEmpty) {
      filteredOrders = filteredOrders
          .where((order) => order.status.toLowerCase() == status.toLowerCase())
          .toList();
    }

    // Filter by search query if provided
    if (searchQuery != null && searchQuery.isNotEmpty) {
      filteredOrders = filteredOrders
          .where((order) =>
              order.id.toLowerCase().contains(searchQuery.toLowerCase()) ||
              order.customerName.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }

    return filteredOrders;
  }

  // Future<Order> getOrderById(String id) async {
  //   final response = await http.get(
  //     Uri.parse('$baseUrl/orders/$id'),
  //     headers: {'Authorization': 'Bearer ${await getToken()}'},
  //   );

  //   if (response.statusCode == 200) {
  //     return Order.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load order details');
  //   }
  // }
}