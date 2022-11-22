import 'package:flutter/material.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Icon(Icons.message),
        onPressed: () => {},
      ),
    );
  }
}
