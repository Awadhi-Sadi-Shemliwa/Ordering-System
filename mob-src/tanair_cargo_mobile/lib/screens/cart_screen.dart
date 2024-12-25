import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   body: Stack(
        children: [
          // Background color section
          Positioned.fill(
            child: Container(
              color: Colors.white, // Set the background color to white
            ),
          ),
          Column(
            children: [
              // Top Close button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.pink[100],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Close the screen
                      },
                      child: Text('Close'),
                    ),
                  ],
                ),
              ),
              // Cart Icon with curved container
              Expanded(
                flex: 1,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // Curved container with background image
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/code_background.png"), // Set the background image
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.shopping_cart, size: 30),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Items', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Expanded(
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          children: List.generate(4, (index) {
                            return Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Positioned.fill(
                                    child: Center(
                                      child: Icon(Icons.image, color: Colors.grey, size: 40), // Placeholder for item image
                                    ),
                                  ),
                                  Positioned(
                                    top: 8,
                                    right: 8,
                                    child: Icon(Icons.close, color: Colors.red, size: 20),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.yellow[100],
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text('\$0.00', style: TextStyle(fontSize: 16)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: Colors.blue[100],
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green[300],
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              // Handle continue action
                            },
                            child: Text('Continue'),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              Navigator.pop(context); // Back to shopping
                            },
                            child: Text('Back to Shopping', style: TextStyle(color: Colors.black)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}