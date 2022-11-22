import 'package:flutter/material.dart';

class TestField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obsCure;
  final IconData icons;
  const TestField(
      {super.key,
      required this.controller,
      required this.labelText,
      required this.icons,
      required this.obsCure});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: TextField(
        controller: controller,
        onChanged: (value) => {},
        decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Icon(
              icons,
            ),
            labelStyle: const TextStyle(
              fontSize: 20.0,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(color: Color.fromARGB(255, 7, 7, 7)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            )),
        obscureText: obsCure,
      ),
    );
    ;
  }
}
