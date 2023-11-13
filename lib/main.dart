import 'package:flutter/material.dart';

void main() {
  runApp(TodoAssignment());
}

class TodoAssignment extends StatelessWidget {
  const TodoAssignment({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: Todo(),
    );
  }
}

class Todo extends StatefulWidget {
  const Todo({super.key});

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<Map<String, String>> itemList = [];
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.blue),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
            child: Container(
              width: double.infinity,
              height: 50.0,
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintText: "Add Title",
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
            child: Container(
              width: double.infinity,
              height: 50,
              child: TextField(
                controller: descriptionController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(12.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  hintText: "Add Description",
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                String title = titleController.text;
                String description = descriptionController.text;

                if (title.isNotEmpty && description.isNotEmpty) {
                  if (selectedIndex == -1) {
                    itemList.add({'title': title, 'description': description});
                  } else {
                    itemList[selectedIndex]['title'] = title;
                    itemList[selectedIndex]['description'] = description;
                    selectedIndex = -1;
                  }

                  titleController.clear();
                  descriptionController.clear();
                }
              });
            },
            child: Text(selectedIndex == -1 ? "Add" : "Update"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.circle, color: Colors.red, size: 50),
                  title: Text(itemList[index]['title'] ?? ''),
                  subtitle: Text(itemList[index]['description'] ?? ''),
                  trailing: Icon(Icons.arrow_forward),
                  onLongPress: () {
                    titleController.text = itemList[index]['title'] ?? '';
                    descriptionController.text = itemList[index]['description'] ?? '';

                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 12.0),
                              child: Container(
                                width: double.infinity,
                                height: 50.0,
                                child: TextField(
                                  controller: titleController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                    hintText: "Add Title",
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                              child: Container(
                                width: double.infinity,
                                height: 50,
                                child: TextField(
                                  controller: descriptionController,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(12.0),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.blue,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    hintText: "Add Description",
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      itemList[index]['title'] = titleController.text;
                                      itemList[index]['description'] = descriptionController.text;
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Text("Edit Done"),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
