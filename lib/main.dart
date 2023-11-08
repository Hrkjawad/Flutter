import 'package:flutter/material.dart';

void main() => runApp(Assignment5());

class Assignment5 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: myAPP(),
    );
  }
}

class myAPP extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
        elevation: 70,
        toolbarHeight: 100,
        leading: Icon(Icons.store),
        actions:[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(Icons.search),
        ),
        ],
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is a mod 5 Assignment",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold

              ),
            ),
            SizedBox(height: 10,),
            RichText(text: const TextSpan(
              text: "My",
              style: TextStyle(fontSize: 26,
              color: Colors.red),
              children: [
                const TextSpan(
                  text: " phone",
                  style: TextStyle(color: Colors.blue,
                  fontSize: 15,),
                ),
                const TextSpan(
                  text: " name",
                  style: TextStyle(color: Colors.purple,
                    fontSize: 19,),
                ),
                const TextSpan(
                  text: " Your phone name",
                  style: TextStyle(color: Colors.yellow,
                  fontSize: 22,),
                )
              ]
            ))
          ],
        ),
      ),
    );
  }
}
