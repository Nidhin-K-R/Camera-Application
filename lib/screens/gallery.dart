import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_camera/screens/camera.dart';
import 'package:flutter_application_1_camera/screens/folderscreen.dart';
import 'package:flutter_application_1_camera/screens/photoscreen.dart';

class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

int indexnum = 0;
late bool flag;

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_alt_outlined), label: "Camera"),
            BottomNavigationBarItem(icon: Icon(Icons.photo), label: "Gallery"),
          ],
          currentIndex: indexnum,
          onTap: (int index) {
            indexnum = index;
            setState(() {
              if (index == 0) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => CameraScreen()));
              } else {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (ctx) => FolderScreen()));
              }
            });
          },
        ),
        appBar: AppBar(
          title: Text("Photos"),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  photo.clear();
                });
              },
              icon: Icon(Icons.delete_forever),
              color: Colors.redAccent,
            ),
          ],
          automaticallyImplyLeading: false,
        ),
        body: photo.isEmpty
            ? Center(
                child: Text("No images"),
              )
            : GridView.builder(
                scrollDirection: Axis.vertical,
                //reverse: true,

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                itemCount: photo.length,
                itemBuilder: (context, index) {
                  //picture.addAll(photo.reversed);
                  int ind = photo.length - 1 - index;

                  XFile data = photo[ind];

                  //photo.removeAt(index);

                  return Builder(builder: (context) {
                    return InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) =>
                                    PhotoScreen(pic: data, index: ind)));
                      },
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.file(
                          height: 100,
                          width: 100,
                          File(data.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  });
                }));
  }
}
