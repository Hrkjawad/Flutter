import 'package:flutter/material.dart';

void main() {
  runApp(Mod9LiveTest());
}

class Mod9LiveTest extends StatelessWidget {
  const Mod9LiveTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAPP(),
    );
  }
}

class MyAPP extends StatefulWidget {
  const MyAPP({Key? key}) : super(key: key);

  @override
  _MyAPPState createState() => _MyAPPState();
}

class _MyAPPState extends State<MyAPP> {
  String sizeSelect = '';

  void _sizeSelect(String size) {
    setState(() {
      sizeSelect = size;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Size Selector"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              spacing: 12,
              runSpacing: 15,
              children: [
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          'S' == sizeSelect ? Colors.orange : Colors.grey,
                    ),
                    onPressed: () {
                      _sizeSelect('S');
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Selected Size S'),
                        ),
                      );
                    },
                    child: Text("S"),
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          'M' == sizeSelect ? Colors.orange : Colors.grey,
                    ),
                    onPressed: () {
                      _sizeSelect('M');
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Selected Size M'),
                        ),
                      );
                    },
                    child: Text("M"),
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          'L' == sizeSelect ? Colors.orange : Colors.grey,
                    ),
                    onPressed: () {
                      _sizeSelect('L');
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Selected Size L'),
                        ),
                      );
                    },
                    child: Text("L"),
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      'XL' == sizeSelect ? Colors.orange : Colors.grey,
                    ),
                    onPressed: () {
                      _sizeSelect('XL');
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Selected Size XL'),
                        ),
                      );
                    },
                    child: Text("XL"),
                  ),
                ),
              ],
            ),
            Wrap(
              spacing: 12,
              runSpacing: 15,
              children: [

                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          'XXL' == sizeSelect ? Colors.orange : Colors.grey,
                    ),
                    onPressed: () {
                      _sizeSelect('XXL');
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Selected Size XXL'),
                        ),
                      );
                    },
                    child: Text("XXL"),
                  ),
                ),
                SizedBox(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          'XXXL' == sizeSelect ? Colors.orange : Colors.grey,
                    ),
                    onPressed: () {
                      _sizeSelect('XXXL');
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Selected Size XXXL'),
                        ),
                      );
                    },
                    child: Text("XXXL"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
