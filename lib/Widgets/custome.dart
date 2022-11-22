import 'package:flutter/material.dart';

class Custome extends StatelessWidget {
  const Custome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 45,
      height: 50,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 30,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(9),
            ),
          ),
          Container(
            height: double.infinity,
            width: 50,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(9),
            ),
            child: Icon(
              Icons.add,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 20.0,
            ),
          ),
        ],
      ),
    );
  }
}
