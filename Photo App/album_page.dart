
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../models/album.dart';
import 'photo_view_page.dart';

class AlbumPage extends StatefulWidget {
  final Album album;

  const AlbumPage({super.key, required this.album});

  @override
  _AlbumPageState createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  final ImagePicker picker = ImagePicker();

  void addPhoto(String path) {
    setState(() {
      widget.album.photos.add(path);
    });
  }

  Future<void> pickAndAddPhoto() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      addPhoto(picked.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.album.name)),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: widget.album.photos.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PhotoViewPage(
                  imagePath: widget.album.photos[index],
                ),
              ),
            ),
            child: Image.file(
              File(widget.album.photos[index]),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pickAndAddPhoto,
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}

