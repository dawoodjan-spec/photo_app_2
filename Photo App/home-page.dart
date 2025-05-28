
import 'package:flutter/material.dart';
import '../models/album.dart';
import 'album_page.dart';
import 'add_album.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Album> albums = [];

  void addAlbum(String name) {
    setState(() {
      albums.add(Album(name: name, photos: []));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Albums')),
      body: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          final album = albums[index];
          return ListTile(
            title: Text(album.name),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => AlbumPage(album: album)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final name = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddAlbumPage()),
          );
          if (name != null) addAlbum(name);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}


photo_view_page.dart

import 'dart:io';
import 'package:flutter/material.dart';

class PhotoViewPage extends StatelessWidget {
  final String imagePath;

  PhotoViewPage({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("View Photo")),
      body: Center(child: Image.file(File(imagePath))),
    );
  }
}




main.dart:

import 'package:flutter/material.dart';
import 'models/album.dart';
import 'screens/album_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Photo Gallery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: AlbumPage(
        album: Album(name: 'My Album', photos: []),
      ),
    );
  }
}
