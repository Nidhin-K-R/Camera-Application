import 'package:flutter/material.dart';
import 'package:flutter_application_1_camera/screens/camera.dart';
import 'package:share_plus/share_plus.dart';

void savingInfo(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      padding: EdgeInsets.all(20),
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
      showCloseIcon: true,
      content: Text(
          "SAVED DCIM/Downloads/photos.9836469693jdjhf73.jpg\n\n${DateTime.now()}")));
}

Future<void> shareOptions(XFile image) async {
/*  Share.share(
    'dfdk84767dkf3434.jpeg\n${DateTime.now()}',
  );*/
  await Share.shareXFiles([image],
      text: "dfsjfnd84374738ndfsl.jpg\n\n${DateTime.now()}");
}

deleteOption(BuildContext context) {
  showAboutDialog(context: context, children: [
    Text("Are you Sure for Delete All ?"),
    IconButton(
        onPressed: () {
          photo.clear();
        },
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ))
  ]);
}
