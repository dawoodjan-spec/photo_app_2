
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
