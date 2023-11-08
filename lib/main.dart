import 'package:flutter/material.dart';

void main() {
  runApp(Assignment6());
}

class Assignment6 extends StatelessWidget {
  const Assignment6({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<int> selectedItems = List.generate(15, (index) => 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products List"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product ${index + 1}"),
                  Text("\$${10}"),
                ],
              ),
            ),
            trailing: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Wrap(
                    children: [
                      Text("Select ${selectedItems[index]}"),
                    ],
                  ),
                  Container(
                    width: 100,
                    height: 20,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (selectedItems[index] > 3) {
                            selectedItems[index] = selectedItems[index] + 1;
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: AlertDialog(
                                    title: Text("Congratulations!"),
                                    content: Text("You've bought 5 Product ${index + 1}"),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text("OK"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          } else {
                            selectedItems[index] = selectedItems[index] + 1;
                          }
                        });
                      },
                      child: Text("BUY NOW"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(selectedItems: selectedItems),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<int> selectedItems;

  const CartPage({Key? key, required this.selectedItems});

  @override
  Widget build(BuildContext context) {
    int totalProducts = selectedItems.fold(0, (sum, item) => sum + item);
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Text("Total Products: $totalProducts"),
      ),
    );
  }
}
