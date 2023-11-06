import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: photoadd(),
    );
  }
}

class photoadd extends StatelessWidget {
  final List<String> imgURLS = [
    'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&q=60&w=700&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Fyc3xlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?auto=format&fit=crop&q=80&w=870&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1506560411-58ae1f86da62?auto=format&fit=crop&q=80&w=870&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1559943098-9caf09cfeefd?auto=format&fit=crop&q=80&w=774&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1619572945516-7598cb601a11?auto=format&fit=crop&q=80&w=1031&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1658775996288-298c44fad693?auto=format&fit=crop&q=80&w=870&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];
  final List<String> imgURLS2 = [
    'https://images.unsplash.com/photo-1492144534655-ae79c964c9d7?auto=format&fit=crop&q=60&w=700&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2Fyc3xlbnwwfHwwfHx8MA%3D%3D',
    'https://images.unsplash.com/photo-1494976388531-d1058494cdd8?auto=format&fit=crop&q=80&w=870&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    'https://images.unsplash.com/photo-1506560411-58ae1f86da62?auto=format&fit=crop&q=80&w=870&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Photo Gallery'),
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "WELCOME TO MY PHOTO GALLARY",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 325,
                    height: 50,
                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for photo',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 335,
                  height: 200,
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    shrinkWrap: true,
                    itemCount: imgURLS.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          final imageName = 'Image ${index + 1}';
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('You Clicked on $imageName'),
                            ),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Image.network(
                            imgURLS[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: imgURLS2.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 50,
                      height: 65,
                      child: ListTile(
                        leading: CircleAvatar(
                          //radius: 50,
                          backgroundImage: NetworkImage(
                              imgURLS2[index]),
                        ),
                        title: Text('Photo ${index + 1}'),
                        subtitle: Text('Description for Photo ${index + 1}'),
                      ),

                    );

                  },
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Photos Uploaded Successfully!'),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(10), // Adjust the padding as needed
                    ),
                    child: Icon(
                      Icons.upload,
                    ))
              ],
            ),
          ),
        ));
  }
}
