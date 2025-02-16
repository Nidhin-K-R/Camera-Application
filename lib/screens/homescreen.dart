import 'package:flutter/material.dart';
import 'package:flutter_application_1_camera/screens/camera.dart';
import 'package:flutter_application_1_camera/screens/folderscreen.dart';
import 'package:flutter_application_1_camera/screens/gallery.dart';
import 'package:flutter_application_1_camera/screens/testing.dart';

class HomeScreen extends StatelessWidget {
  // final List<CameraDescription> camera;
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Photo Capture App",
          style: TextStyle(fontSize: 23),
        ),
        centerTitle: true,
      ),*/
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR4NeHuIPmh4nui9jzbuAPZBO5yFONr7Pl4pg&s"),
            Positioned(
              top: 20,
              left: 50,
              child: Text(
                "Photo Capture App",
                style: TextStyle(
                    fontSize: 30, color: const Color.fromARGB(255, 0, 0, 3)),
              ),
            ),
            Center(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (ctx) => CameraScreen()));
                  },
                  label: Text("Open Camera"),
                  icon: Icon(Icons.camera_alt_outlined),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    flag = false;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => FolderScreen()));
                  },
                  label: Text("Gallery"),
                  icon: Icon(Icons.photo_outlined),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (ctx) => Testing()));
                    },
                    icon: Icon(
                      Icons.arrow_right,
                      color: Colors.black,
                    )),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
