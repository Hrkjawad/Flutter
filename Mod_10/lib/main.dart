
import 'package:flutter/material.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class Todo {
  String title, details;

  Todo({
    required this.title,
    required this.details,
  });
}

class UpdateTodo extends StatefulWidget {
  final Todo todos;
  final Function(String, String, int) todoUpdate;
  final int index;
  const UpdateTodo({
    super.key,
    required this.todos,
    required this.todoUpdate,
    required this.index,
  });

  @override
  State<UpdateTodo> createState() => _UpdateTodoState();
}

class _UpdateTodoState extends State<UpdateTodo> {
  final TextEditingController updateTitleController = TextEditingController();
  final TextEditingController updateDetailsController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    updateTitleController.text = widget.todos.title;
    updateDetailsController.text = widget.todos.details;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: _globalKey,
        child: Column(
          children: [
            TextFormField(
                controller: updateTitleController,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 3)),
                    enabledBorder: OutlineInputBorder()),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter a value";
                  }
                  return null;
                }),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                controller: updateDetailsController,
                decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.cyan, width: 3)),
                    enabledBorder: OutlineInputBorder()),
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return "Enter a vallue";
                  }
                  return null;
                }),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.cyan),
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    String updatedTitle = updateTitleController.text.trim();
                    String updatedDetails = updateDetailsController.text.trim();
                    widget.todoUpdate(
                        updatedTitle, updatedDetails, widget.index);
                    Navigator.pop(context);
                  }
                },
                child: const Text(
                  "Edit Done",
                  style: TextStyle(fontSize: 16),
                ))
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> tasks = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: const [
          Icon(
            Icons.search,
            color: Colors.blue,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            AddTodo(
              onAddTodo: (Todo todo) {
                addTodo(todo);
              },
            ),
            const SizedBox(
              height: 38,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: tasks.length,
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(
                  height: 12,
                ),
                itemBuilder: (context, index) {
                  return ListTile(
                    tileColor: Colors.grey.shade300,
                    onLongPress: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                title: const Text("Alert"),
                                content: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return UpdateTodo(
                                                  todos: tasks[index],
                                                  index: index,
                                                  todoUpdate:
                                                      (String updateTitle,
                                                      String updateDetails,
                                                      int index) {
                                                    updateTodo(
                                                        index,
                                                        updateTitle,
                                                        updateDetails);
                                                  },
                                                );
                                              });
                                        },
                                        child: const Text(
                                          "Edit",
                                          style: TextStyle(color: Colors.cyan),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          deleteTodo(index);
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Delete",
                                          style: TextStyle(color: Colors.cyan),
                                        ))
                                  ],
                                ));
                          });
                    },
                    title: Text(
                      tasks[index].title,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(tasks[index].details),
                    leading: const CircleAvatar(
                      backgroundColor: Colors.cyan,
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void addTodo(Todo todo) {
    tasks.add(todo);
    setState(() {});
  }

  void deleteTodo(int index) {
    tasks.removeAt(index);
    setState(() {});
  }

  void updateTodo(int index, String updateTitle, String updateDetails) {
    tasks[index].title = updateTitle;
    tasks[index].details = updateDetails;
    setState(() {});
  }
}

class AddTodo extends StatefulWidget {
  final Function(Todo) onAddTodo;
  const AddTodo({
    super.key,
    required this.onAddTodo,
  });

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController addTitleController = TextEditingController();
  final TextEditingController addDetailsController = TextEditingController();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  void dispose() {
    addTitleController.dispose();
    addDetailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: Column(
        children: [
          TextFormField(
              controller: addTitleController,
              decoration: const InputDecoration(
                  hintText: "Add Title",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 3),
                  ),
                  enabledBorder: OutlineInputBorder()),
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return "Enter a value";
                }
                return null;
              }),
          const SizedBox(
            height: 12,
          ),
          TextFormField(
              controller: addDetailsController,
              decoration: const InputDecoration(
                  hintText: "Add description",
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.cyan, width: 3),
                  ),
                  enabledBorder: OutlineInputBorder()),
              validator: (String? value) {
                if (value?.isEmpty ?? true) {
                  return "Enter a value";
                }
                return null;
              }),
          const SizedBox(
            height: 5,
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
              ),
              onPressed: () {
                if (_globalKey.currentState!.validate()) {
                  Todo newTodo = Todo(
                      title: addTitleController.text.trim(),
                      details: addDetailsController.text.trim());
                  widget.onAddTodo(newTodo);
                  addTitleController.clear();
                  addDetailsController.clear();
                }
              },
              child: const Text(
                "Add",
                style: TextStyle(fontSize: 16),
              ))
        ],
      ),
    );
  }
}