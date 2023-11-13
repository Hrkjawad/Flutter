import 'package:flutter/material.dart';

void main() {
  runApp(
    Mod5LiveTest(),
  );
}

class Mod5LiveTest extends StatelessWidget {
  Mod5LiveTest({super.key});
  List<String> items = ['PHONE', 'CAMERA', 'LAPTOP', 'PC', 'DSLR'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("My Shopping List"),
            centerTitle: true,
            actions: [
             const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: const Icon(Icons.shopping_cart),
              ),
            ],
          ),
          body: ListView.separated(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(items[index]),
                leading: const Icon(Icons.arrow_circle_right_outlined),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 10,
              );
            },
          )),
    );
  }
}
