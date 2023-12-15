import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_task/MatchDetails.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Match List',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blue,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('FootballScore')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.connectionState == ConnectionState.active ||
                  snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data?.docs.length ?? 0,
                    itemBuilder: (context, index) {
                      final QueryDocumentSnapshot item =
                          snapshot.data!.docs[index];
                      return ListTile(
                        title: Text(
                          item['Team1'] + ' Vs ' + item['Team2'],
                          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.w500),
                        ),
                        onTap: () {
                          Get.to(MatchDetails(
                            matchName: item['MatchName'],
                          ));
                        },
                        trailing: const Icon(Icons.arrow_forward),
                      );
                    },
                  );
                }
              }
              return const Center(
                child: Text("Unexpected state"),
              );
            }),
      ),
    );
  }
}
