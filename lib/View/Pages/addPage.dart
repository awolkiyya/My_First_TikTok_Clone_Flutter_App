import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_tiktok/View/conferm_screen.dart';
import 'package:my_tiktok/colors.dart';
import 'dart:io';

class AddPage extends StatelessWidget {
  const AddPage({super.key});
  pickVedio(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ConfirmScreen(videoFile: File(video.path), videoPath: video.path),
        ),
      );
    } else {
      Get.snackbar("Vedio Error", "Your Vedio is Not Selected");
    }
  }

  showDialogBox(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              backgroundColor: Color.fromARGB(255, 147, 143, 143),
              children: [
                SimpleDialogOption(
                  onPressed: () => {
                    pickVedio(ImageSource.gallery, context),
                  },
                  child: Row(
                    children: [
                      Icon(Icons.image),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Gallary"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SimpleDialogOption(
                  onPressed: () => {},
                  child: Row(
                    children: [
                      Icon(Icons.camera),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Camera"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                SimpleDialogOption(
                  onPressed: () => {
                    Navigator.pop(context),
                  },
                  child: Row(
                    children: [
                      Icon(Icons.cancel),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("Cancel"),
                      ),
                    ],
                  ),
                ),
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: InkWell(
            onTap: () => {
                  showDialogBox(context),
                },
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Text(
                  'Add Vedio',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w900),
                ),
              ),
            )),
      ),
    );
  }
}
