import 'package:flutter/material.dart';
import 'package:my_tiktok/Widgets/navigationWidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

// now start working on home screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Positioned(
          //   width: MediaQuery.of(context).size.width,
          //   height: MediaQuery.of(context).size.height,
          //   child: Container(
          //     color: Color.fromARGB(255, 88, 83, 83),
          //   ),
          // ),
        ],
      ),
      bottomNavigationBar: NavigationWidget(),
    );
  }
}
