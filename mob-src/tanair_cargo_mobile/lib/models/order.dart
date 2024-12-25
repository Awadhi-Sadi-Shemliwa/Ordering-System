class Order {
  final String id;
  final String customerName;
  final String productName;
  final int quantity;
  final double price;
  String status; // pending, shipped, delivered

  Order({
    required this.id,
    required this.customerName,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.status,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      customerName: json['customerName'],
      productName: json['productName'],
      quantity: json['quantity'],
      price: json['price'].toDouble(),
      status: json['status'],
    );
  }
}
