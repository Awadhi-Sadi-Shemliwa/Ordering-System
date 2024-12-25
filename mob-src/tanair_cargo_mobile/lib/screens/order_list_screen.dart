import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../components/order_card.dart';
import '../models/order.dart';

class OrderListScreen extends StatefulWidget {
  const OrderListScreen({super.key});

  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final ApiService _apiService = ApiService();
  List<Order> _orders = [];
  String _searchQuery = '';
  String _selectedStatus = '';
  bool _isLoading = false;
  
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadOrders();
  }

  Future<void> _loadOrders() async {
    setState(() => _isLoading = true);
    try {
      final orders = await _apiService.getOrders(
        searchQuery: _searchQuery.isEmpty ? null : _searchQuery,
        status: _selectedStatus.isEmpty ? null : _selectedStatus,
      );
      setState(() => _orders = orders);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search by order number or customer name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              onChanged: (value) {
                setState(() => _searchQuery = value);
                _loadOrders();
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Status filter chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                FilterChip(
                  label: Text('All'),
                  selected: _selectedStatus.isEmpty,
                  onSelected: (selected) {
                    setState(() => _selectedStatus = '');
                    _loadOrders();
                  },
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text('Pending'),
                  selected: _selectedStatus == 'pending',
                  onSelected: (selected) {
                    setState(() => _selectedStatus = selected ? 'pending' : '');
                    _loadOrders();
                  },
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text('Shipped'),
                  selected: _selectedStatus == 'shipped',
                  onSelected: (selected) {
                    setState(() => _selectedStatus = selected ? 'shipped' : '');
                    _loadOrders();
                  },
                ),
                SizedBox(width: 8),
                FilterChip(
                  label: Text('Delivered'),
                  selected: _selectedStatus == 'delivered',
                  onSelected: (selected) {
                    setState(() => _selectedStatus = selected ? 'delivered' : '');
                    _loadOrders();
                  },
                ),
              ],
            ),
          ),
          // Orders list
          Expanded(
            child: _isLoading
                ? Center(child: CircularProgressIndicator())
                : _orders.isEmpty
                    ? Center(
                        child: Text('No orders found'),
                      )
                    : RefreshIndicator(
                        onRefresh: _loadOrders,
                        child: ListView.builder(
                          itemCount: _orders.length,
                          itemBuilder: (context, index) {
                            return OrderCard(
                              order: _orders[index],
                              onTap: () => Navigator.pushNamed(
                                context,
                                '/order-detail',
                                arguments: _orders[index],
                              ),
                            );
                          },
                        ),
                      ),
          ),
        ],
      ),
    );
  }
}