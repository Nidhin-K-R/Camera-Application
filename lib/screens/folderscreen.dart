import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1_camera/functions/functions.dart';
import 'package:flutter_application_1_camera/screens/camera.dart';
import 'package:flutter_application_1_camera/screens/gallery.dart';
import 'package:flutter_application_1_camera/screens/homescreen.dart';

class FolderScreen extends StatefulWidget {
  const FolderScreen({super.key});

  @override
  State<FolderScreen> createState() => _FolderScreenState();
}

class _FolderScreenState extends State<FolderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gallery"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
            },
            icon: Icon(Icons.arrow_back)),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => CameraScreen()));
        },
        child: Icon(Icons.photo_camera_outlined),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            InkWell(
              onLongPress: () {
                setState(() {
                  deleteOption(context);
                });
              },
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (ctx) => Gallery()));
              },
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(97, 179, 177, 172),
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(20),
                height: 120,
                width: 120,
                child: photo.isEmpty ? null : Image.file(File(photo.last.path)),
              ),
            ),
            Positioned(
              top: 140,
              left: 45,
              //bottom: 100,
              child: Text(
                "Camera",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Positioned(
              right: 5,
              child: InkWell(
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(97, 179, 177, 172),
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(20),
                  height: 120,
                  width: 120,
                  child: Image.network(
                      height: 20,
                      width: 20,
                      "https://supersourcing.com/blog/wp-content/uploads/2024/02/xx_important_things_to_consider_while_hiring_a_flutter_developer-scaled.webp"),
                ),
              ),
            ),
            Positioned(
              top: 140,
              right: 35,
              //bottom: 100,
              child: Text(
                "Downloads",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
