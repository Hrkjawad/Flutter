import 'package:flutter/material.dart';

void main() {
  runApp(Mod10LiveTest());
}

class Mod10LiveTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAPP(),
    );
  }
}
class SelectableItem {
  String Names;
  bool isSelected;
  SelectableItem(this.Names, this.isSelected);
}

class MyAPP extends StatefulWidget {
  @override
  _MyAPP createState() => _MyAPP();
}

class _MyAPP extends State<MyAPP> {
  List<SelectableItem> itemList = List.generate(
    5,
    (index) => SelectableItem("Item ${index + 1}", false),
  );

  int selectedCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Items'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: itemList.length,
          itemBuilder: (context, index) {
            return buildItemTile(itemList[index]);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showSelectedItemsDialog();
        },
        child: Icon(Icons.check),
      ),
    );
  }

  Widget buildItemTile(SelectableItem item) {
    return Card(
      color: item.isSelected ? Colors.blue : null,
      child: ListTile(
        title: Text(
          item.Names,
          style: TextStyle(
            color: item.isSelected ? Colors.white : Colors.black,
          ),
        ),
        onTap: () {
          setState(() {
            item.isSelected = !item.isSelected;
            selectedCount += item.isSelected ? 1 : -1;
          });
        },
      ),
    );
  }

  void showSelectedItemsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Selected Items'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              Text(
                'Number of selected items: $selectedCount',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        );
      },
    );
  }
}
