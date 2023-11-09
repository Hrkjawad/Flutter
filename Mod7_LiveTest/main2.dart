import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LiveTest6(),
    );
  }
}

class LiveTest6 extends StatefulWidget {
  const LiveTest6({super.key});

  @override
  State<LiveTest6> createState() => _LiveTest6State();
}

class _LiveTest6State extends State<LiveTest6> {

  var count=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
      title: Text("Counter App"),
    ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text("Count:",
            style: TextStyle(fontSize: 22,),
            ),
            Text("$count",
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),),
          Wrap(
         children:[ ElevatedButton(onPressed: (){
           setState(() {


           if(count>=4){
             count++;
             showDialog(
               context: context,
               barrierDismissible: false,
               builder: (context) {
                 return Padding(
                   padding: const EdgeInsets.all(16.0),
                   child: AlertDialog(

                     content: Text("Button Pressed ${count} Times"),
                     actions: [
                       TextButton(
                         onPressed: () {
                           Navigator.pop(context);
                         },
                         child: Text("Close"),
                       ),
                     ],
                   ),
                 );
               },
             );
           }
           else{
             count++;
           }
           });
         }, child: Icon(Icons.add)),
           SizedBox(width: 20),
            ElevatedButton(onPressed: (){
              setState(() {
                if(count<=0){
                count==0;
              }
                else{
                  count--;
                }
              });
            }, child: Icon(Icons.remove))
          ],),
          ],
        ),
      ),
    );
  }
}
