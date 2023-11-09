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
      home: Mod8Assignment(),
    );
  }
}
class Mod8Assignment extends StatelessWidget {
  const Mod8Assignment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints){
          return OrientationBuilder(
            builder: (context, orientation){
              if(orientation==Orientation.portrait){
                return _portraitScreen();
              }
              else{
                return _landscapeScreen();
              }
            },
          );
        },
      ),
    );}
}

  Widget _portraitScreen(){
    return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10,),
            Center(
              child: ClipOval(
                  child: Image.network(
                      height: 300,
                      width: 300,
                      fit:BoxFit.cover,
                      "https://img.freepik.com/premium-photo/cinematic-cartoon-techsavvy-boy-lens-expertly-crafting-content-with-his-laptop-gl_1000124-408.jpg")
              ),
            ),
            SizedBox(height: 10,),
            Text("Hi There",
              style: TextStyle( fontSize: 18 ,fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children:[ Text("This is a mod 8 assignment. This assignment is Create screen which rearranges its widgets while changing orientation.",
                  style: TextStyle( fontSize: 14),
                ),

        ],
              ),

            ),
            GridView.builder(
                itemCount: 6,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.network("https://img.freepik.com/premium-photo/celebratingglobal-connectivityembracing-essence-international-internet-day_351245-2807.jpg"
                ),
              );
            })
          ],
        ),

      );
  }
Widget _landscapeScreen(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      children: [
        Container(
          height: 300,
          width: 300,
          child: CircleAvatar(
              radius: 150,
      backgroundImage: NetworkImage("https://img.freepik.com/premium-photo/cinematic-cartoon-techsavvy-boy-lens-expertly-crafting-content-with-his-laptop-gl_1000124-408.jpg"),
          ),
        ),

        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Hi There",
                    style: TextStyle( fontSize: 18 ,fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("This is a mod 8 assignment. This assignment is Create screen which rearranges its widgets while changing orientation.",
                    style: TextStyle( fontSize: 14),
                  ),
                ),
                GridView.builder(
                    itemCount: 6,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3), itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Image.network("https://img.freepik.com/premium-photo/celebratingglobal-connectivityembracing-essence-international-internet-day_351245-2807.jpg"
                    ),
                  );
                })
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
