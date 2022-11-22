import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_tiktok/Controllers/uploadVideioController.dart';
import 'package:my_tiktok/Widgets/testfield.dart';
// import 'package:tiktok_tutorial/controllers/upload_video_controller.dart';
// import 'package:tiktok_tutorial/views/widgets/text_input_field.dart';
import 'package:video_player/video_player.dart';

class ConfirmScreen extends StatefulWidget {
  final File videoFile;
  final String videoPath;
  const ConfirmScreen({
    Key? key,
    required this.videoFile,
    required this.videoPath,
  }) : super(key: key);

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  late VideoPlayerController controller;
  late File file;
  TextEditingController _songController = TextEditingController();
  TextEditingController _captionController = TextEditingController();
  UploadVideoController uploadVideoController =
      Get.put(UploadVideoController());
  // UploadVideoController uploadVideoController =
  //     Get.put(UploadVideoController());

  @override
  void initState() {
    super.initState();
    setState(() {
      controller = VideoPlayerController.file(File(widget.videoPath));
      file = File(widget.videoPath);
    });
    controller.initialize();
    controller.play();
    controller.setVolume(1);
    controller.setLooping(true);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.5,
                child: VideoPlayer(controller),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TestField(
                      controller: _songController,
                      labelText: "Song Name",
                      icons: Icons.music_note,
                      obsCure: false,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    width: MediaQuery.of(context).size.width - 20,
                    child: TestField(
                      controller: _captionController,
                      labelText: "Caption",
                      icons: Icons.closed_caption,
                      obsCure: false,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                      onPressed: () => {
                            uploadVideoController.uploadVideo(
                                _songController.text,
                                _captionController.text,
                                file),
                          },
                      child: const Text(
                        'Share!',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
