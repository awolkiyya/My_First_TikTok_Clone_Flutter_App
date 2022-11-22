import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:my_tiktok/Model/user.dart' as model;
import 'package:my_tiktok/View/homeScreen.dart';
import 'package:my_tiktok/View/loginpage.dart';
import 'package:my_tiktok/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_tiktok/main.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  late Rx<File?> _pickedImage;
  late Rx<User?> _user;
  File? get profilephoto => _pickedImage.value;
  User get user => _user.value!;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAll(() =>
          HomeScreen()); // this is used for routing in to some screen using get.ofAll()
    } else {
      Get.offAll(() => LoginPage());
    }
  }

  void pickImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      Get.snackbar("Profile Picture", "Your profile selected");
    }
    _pickedImage = Rx<File?>(File(pickedImage!.path));
  }

  Future<String> _uploadImage(File image) async {
    // find the current user and create feild to store image
    Reference ref = firebaseStorage
        .ref()
        .child('profilepicture')
        .child(firebaseAuth.currentUser!.uid);
    // now start to upload this images
    UploadTask task = ref.putFile(image);
    TaskSnapshot snapshot = await task;
    String url = await snapshot.ref.getDownloadURL();
    return url;
  }

  // now one things is should understands are this concepts is like laravel
  void register(
      String username, String password, String email, File? image) async {
    // this method is the used for registration purposes
    try {
      if (username.isNotEmpty &&
          password.isNotEmpty &&
          email.isNotEmpty &&
          image != null) {
        // then store the user to auth and firebase store
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: email, password: password);
        // now after store auth then store data to firebase storege
        // call the method to store data
        String url = await _uploadImage(image);
        model.User user = model.User(
            name: username, profile: url, email: email, uid: cred.user!.uid);
        await firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar('not fill all data to create account', 'fill all field');
      }
    } catch (e) {
      Get.snackbar(
        'not fill all data to create account',
        e.toString(),
      );
    }
  }

  void login(String email, String password) async {
    try {
      if (email != null && password != null) {
        await firebaseAuth.signInWithEmailAndPassword(
            email: email, password: password);
      }
    } catch (e) {
      Get.snackbar(
        'Login Error',
        e.toString(),
      );
    }
  }

  void delete() {}
}
