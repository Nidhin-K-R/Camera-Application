import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1_camera/functions/functions.dart';
import 'package:flutter_application_1_camera/screens/camera.dart';

import 'package:flutter_application_1_camera/screens/gallery.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class PhotoScreen extends StatefulWidget {
  XFile pic;
  int index;
  PhotoScreen({super.key, required this.pic, required this.index});

  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  @override
  Widget build(BuildContext context) {
    //print(widget.index);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (int indexing) {
          indexing++;
          setState(() {
            switch (indexing) {
              case 1:
                savingInfo(context);

                break;
              case 2:
                shareOptions();

                break;
              case 3:
                photo.removeAt(widget.index);
                //  photo.clear();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => Gallery()));

                break;
            }
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.info,
              color: Colors.blueGrey,
            ),
            label: "info",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.share,
              color: Colors.blueGrey,
            ),
            label: "share",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.delete,
              color: Colors.blueGrey,
            ),
            label: "delete",
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Your Photo"),
        centerTitle: true,
        backgroundColor: Colors.grey,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (ctx) => Gallery()));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Image.file(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        File(widget.pic.path),
        fit: BoxFit.cover,
      ),
    );
  }
}
