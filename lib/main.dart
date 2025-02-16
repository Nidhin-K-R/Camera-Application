import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1_camera/screens/homescreen.dart';

var cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();

  runApp(
    MaterialApp(
      //theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
  );
}
