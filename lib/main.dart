import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Assignment9(),
    );
  }
}

class Assignment9 extends StatefulWidget {
  const Assignment9({Key? key});

  @override
  State<Assignment9> createState() => _Assignment9State();
}

class _Assignment9State extends State<Assignment9> {
  int item1=0;int item2=0;int item3=0; int totalamount=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Text(
              "My Bag",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  width: 343,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.network(
                          "https://5.imimg.com/data5/ANDROID/Default/2022/8/CB/TQ/CW/63738590/product-jpeg-500x500.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 52,
                            width: 225,
                            child:  ListTile(
                              title: Text(
                                "Sports sneakers",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Icon (Icons.more_vert),
                              subtitle: RichText(
                                text: TextSpan(
                                  text: "Color: ",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                  children: [
                                    TextSpan(
                                      text: "Black   ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Size: ",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    TextSpan(
                                      text: "L",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),

                            ),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                  if(item1<=0){
                                    item1=0;
                                  }
                                  else{
                                    item1--;
                                    totalamount-=50;
                                  }
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.grey,
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: CircleBorder()),
                              ),
                              Text("${item1}"),
                              ElevatedButton(
                                onPressed: () {

                                  setState(() {});
                                    item1++;
                                  totalamount+=50;
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: CircleBorder()),
                              ),
                              SizedBox(width: 50,),
                              Text("50\$",
                              style:TextStyle (fontWeight: FontWeight.bold, fontSize: 17),
                              ),

                            ],

                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: Column(
              children: [
                Container(
                  width: 343,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.network(
                          "https://5.imimg.com/data5/ANDROID/Default/2022/8/CB/TQ/CW/63738590/product-jpeg-500x500.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 52,
                            width: 225,
                            child:  ListTile(
                              title: Text(
                                "Sports sneakers",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Icon (Icons.more_vert),
                              subtitle: RichText(
                                text: TextSpan(
                                  text: "Color: ",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                  children: [
                                    TextSpan(
                                      text: "Black   ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Size: ",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    TextSpan(
                                      text: "L",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),

                            ),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                  if(item2<=0){
                                    item2=0;
                                  }
                                  else{
                                    item2--;
                                    totalamount-=120;
                                  }
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.grey,
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: CircleBorder()),
                              ),
                              Text("${item2}"),
                              ElevatedButton(
                                onPressed: () {

                                  setState(() {});
                                  item2++;
                                  totalamount+=90;
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: CircleBorder()),
                              ),
                              SizedBox(width: 50,),
                              Text("90\$",
                                style:TextStyle (fontWeight: FontWeight.bold, fontSize: 17),
                              ),

                            ],

                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Column(
              children: [
                Container(
                  width: 343,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.network(
                          "https://5.imimg.com/data5/ANDROID/Default/2022/8/CB/TQ/CW/63738590/product-jpeg-500x500.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 52,
                            width: 225,
                            child:  ListTile(
                              title: Text(
                                "Sports sneakers",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Icon (Icons.more_vert),
                              subtitle: RichText(
                                text: TextSpan(
                                  text: "Color: ",
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.grey),
                                  children: [
                                    TextSpan(
                                      text: "Black   ",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: " Size: ",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.grey),
                                    ),
                                    TextSpan(
                                      text: "L",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),

                            ),
                          ),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {});
                                  if(item3<=0){
                                    item3=0;
                                  }
                                  else{
                                    item3--;
                                    totalamount-=120;
                                  }
                                },
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.grey,
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: CircleBorder()),
                              ),
                              Text("${item3}"),
                              ElevatedButton(
                                onPressed: () {

                                  setState(() {});
                                  item3++;
                                  totalamount+=120;
                                },
                                child: Icon(
                                  Icons.add,
                                  color: Colors.grey,
                                ),
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: CircleBorder()),
                              ),
                              SizedBox(width: 50,),
                              Text("120\$",
                                style:TextStyle (fontWeight: FontWeight.bold, fontSize: 17),
                              ),

                            ],

                          ),

                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  Wrap(
                    children: [
                       ListTile(
                        leading: Text(
                          "Total Amount:",
                          style: TextStyle(fontSize: 17, color: Colors.grey),
                        ),
                        trailing: Text(
                          "${totalamount <= 0 ? 0 : totalamount}\$",
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shadowColor: Colors.red,
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        final message = SnackBar(
                            content: Text(
                                "Congratulations! You Purchased All Products."));
                        ScaffoldMessenger.of(context).showSnackBar(message);
                      },
                      child: Text("CHECK OUT"),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],

      ),

    );
  }
}
