
import 'package:flutter/material.dart';

void main(){
  runApp(Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Practice"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        actions: [
          IconButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content: Text("Pressed"),
                backgroundColor: Colors.lightBlue,
              )
            );
          }, icon: Icon(Icons.dehaze_sharp))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Button Pressed!'),
                      backgroundColor: Colors.blue,
                    ),
                  );
                }, child: Icon(Icons.messenger)),
              ),
            ),
            Container(
              width: double.infinity,
                padding: EdgeInsets.all(16.0),
                child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.blue,
                      iconColor: Colors.white
                    ),

                    onPressed: (){}, child: Icon(Icons.call)))
          ],
        ),
      )


    );
  }
}
