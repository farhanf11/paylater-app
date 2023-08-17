import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<ImageSource?> showImageSource(BuildContext context) async {
  if (Platform.isIOS) {
    return showCupertinoModalPopup<ImageSource>(
        context: context,
        builder: (context) => CupertinoActionSheet(
              actions: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop(ImageSource.camera);
                    },
                    child: Text('Camera')),
                CupertinoActionSheetAction(
                    onPressed: () =>
                        Navigator.of(context).pop(ImageSource.gallery),
                    child: Text('Gallery'))
              ],
            ));
  } else {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: Text('Camera'),
                    onTap: () => Navigator.of(context).pop(ImageSource.camera)),
                ListTile(
                    leading: Icon(Icons.image),
                    title: Text('Gallery'),
                    onTap: () =>
                        Navigator.of(context).pop(ImageSource.gallery)),
              ],
            ));
  }
}
