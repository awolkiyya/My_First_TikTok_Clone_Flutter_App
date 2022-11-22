import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:my_tiktok/Model/video.dart' as model;
import 'package:my_tiktok/colors.dart';
import 'dart:io';

class UploadVideoController extends GetxController {
  Future<String> _uploadVideoToStorage(String id, File videoPath) async {
    Reference ref = firebaseStorage.ref().child('videos').child(id);
    print("some message{$ref}");
    UploadTask uploadTask = ref.putFile(videoPath);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    print("some message{$downloadUrl}");
    return downloadUrl;
  }

  Future<String> _uploadImageToStorage(String id, File videoPath) async {
    Reference ref = firebaseStorage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(videoPath);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    print("some{$downloadUrl}");
    return downloadUrl;
  }

  // upload video
  uploadVideo(String songName, String caption, File videoPath) async {
    try {
      String uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await firestore.collection('users').doc(uid).get();
      // get id
      var allDocs = await firestore.collection('videos').get();
      int len = allDocs.docs.length;
      String videoUrl = await _uploadVideoToStorage("Video $len", videoPath);
      String thumbnail = await _uploadImageToStorage("Video $len", videoPath);
      print((userDoc.data()! as Map<String, dynamic>)['profilePhoto']);
      model.Video video = model.Video(
        username: (userDoc.data()! as Map<String, dynamic>)['name'],
        uid: uid,
        id: "Video $len",
        likes: [],
        commentCount: 0,
        shareCount: 0,
        songName: songName,
        caption: caption,
        videoUrl: videoUrl,
        profilePhoto: (userDoc.data()! as Map<String, dynamic>)['profile'],
        thumbnail: thumbnail,
      );
      print("information in model{$video}");
      await firestore.collection('videos').doc('Video $len').set(
            video.toJson(),
          );
      Get.back();
    } catch (e) {
      Get.snackbar(
        'Error Uploading Video',
        e.toString(),
      );
    }
  }
}
