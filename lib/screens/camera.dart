import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_camera/main.dart';
import 'package:flutter_application_1_camera/screens/gallery.dart';
import 'package:flutter_application_1_camera/screens/homescreen.dart';

class CameraScreen extends StatefulWidget {
  // final List<CameraDescription> camera;
  const CameraScreen({super.key});
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

final List<XFile> photo = [];

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  bool rearCamera = true;
  bool isRecording = true;
  late Future futureController;
  var cm = 0;
  Future<void> _initializeCamera(CameraDescription camera) async {
    _controller = CameraController(camera, ResolutionPreset.high);

    futureController = _controller.initialize();
  }

  @override
  void initState() {
    _initializeCamera(cameras[cm]);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () async {
          XFile image = await _controller.takePicture();
          setState(() {
            photo.add(image);
            //picture = photo.reversed.toList();
          });
        },
        child: Icon(
          Icons.camera_alt_rounded,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder(
          future: futureController,
          builder: (context, value) {
            if (value.connectionState == ConnectionState.done) {
              return Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: CameraPreview(_controller),
                  ),
                  Positioned(
                      top: 10,
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => HomeScreen()));
                          },
                          icon: Icon(Icons.arrow_back))),
                  Positioned(
                    //top: 100,
                    bottom: 20,
                    left: 30,
                    child: InkWell(
                      onTap: () {
                        flag = true;
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (ctx) => Gallery()));
                      },
                      child: Container(
                        color: Color.fromARGB(106, 124, 124, 128),
                        height: 80,
                        width: 80,
                        child: photo.isEmpty
                            ? null
                            /*Image.network(
                                "https://static.vecteezy.com/system/resources/thumbnails/022/059/000/small_2x/no-image-available-icon-vector.jpg")*/
                            : Image.file(
                                fit: BoxFit.cover, File(photo.last.path)),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 30,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            rearCamera = !rearCamera;
                            rearCamera ? cm = 0 : cm = 1;
                            _initializeCamera(cameras[cm]);
                          });
                          //print("pressed");
                        },
                        icon: Icon(
                          Icons.cameraswitch_outlined,
                          size: 50,
                          color: Colors.grey,
                        )),
                  ),
                ],
              );
              //Expanded(child: CameraPreview(_controller));
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
