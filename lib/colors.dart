import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:my_tiktok/Controllers/auth.dart';
import 'package:my_tiktok/View/Pages/addPage.dart';
import 'package:my_tiktok/View/Pages/homePage.dart';
import 'package:my_tiktok/View/Pages/messagePage.dart';
import 'package:my_tiktok/View/Pages/profilePage.dart';
import 'package:my_tiktok/View/Pages/searchPage.dart';
import 'package:my_tiktok/View/homeScreen.dart';

// now here setup the list of the pages used in your application
List pages = [
  HomePage(),
  SearchScreen(),
  const AddPage(),
  Text('Messages Screen'),
  ProfileScreen(uid: authController.user.uid),
];

// COLORS
const backgroundColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// controller
var authController = AuthController.instance;
