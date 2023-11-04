import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;//i paste (http: ^0.13.3) in pubspec.yaml and save it
import 'dart:convert';

void main() {
  runApp(Mod11_assignment());
}

class Mod11_assignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PhotoList(),
    );
  }
}

class Photo {
  final int id;
  final String title,thumbnailUrl;

  Photo({
    required this.id,
    required this.title,
    required this.thumbnailUrl,
  });
}

class PhotoList extends StatefulWidget {
  @override
  PhotoListState createState() => PhotoListState();
}

class PhotoListState extends State<PhotoList> {
  final String apiUrl = 'https://jsonplaceholder.typicode.com/photos';
  List<Photo> photos = [];

  Future<void> fetchPhotos() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        setState(() {
          photos = data.map((photo) => Photo(
            id: photo['id'],
            title: photo['title'],
            thumbnailUrl: photo['thumbnailUrl'],
          )).toList();
        });
      } else {
        throw Exception('Sorry it Failed to fetch photos from net');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchPhotos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery App'),
      ),
      body: photos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: photos.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.network(photos[index].thumbnailUrl),
            title: Text(photos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PhotoDetail(photos: photos[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class PhotoDetail extends StatelessWidget {
  final Photo photos;

  PhotoDetail({required this.photos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Detail'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            photos.thumbnailUrl,
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Title: ${photos.title}',
              style: TextStyle(fontSize: 14),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'ID: ${photos.id}',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
