import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  List<String> imgPaths = [];

  Future<void> _chooseImgs() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles != null) {
      imgPaths = pickedFiles.map((img) => img.path).toList();
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Gallery App'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.65,
            child: ListView.builder(
              itemCount: imgPaths.length,
              itemBuilder: (context, index) {
                return Image.file(
                  File(imgPaths[index]),
                  fit: BoxFit.contain,
                  height: 250,
                );
              },
            ),
          ),
          ElevatedButton(onPressed: _chooseImgs, child: Text('Add Image'))
        ],
      ),
    );
  }
}
