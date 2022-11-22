import 'package:flutter/material.dart';
import 'package:my_tiktok/Widgets/custome.dart';
import 'package:my_tiktok/colors.dart';

class NavigationWidget extends StatefulWidget {
  const NavigationWidget({super.key});
  @override
  State<NavigationWidget> createState() => _NavigationWidgetState();
}

class _NavigationWidgetState extends State<NavigationWidget> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromARGB(59, 8, 8, 8),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30.0,
              // color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              size: 30.0,
              // color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: 'Seach',
          ),
          BottomNavigationBarItem(
            icon: Custome(),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
              size: 30.0,
              // color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30.0,
              // color: Color.fromARGB(255, 255, 255, 255),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: index,
        selectedItemColor: Color.fromARGB(255, 255, 40, 2),
        unselectedItemColor: Colors.white,
        onTap: ((value) => {
              setState(
                () => {
                  index = value,
                },
              )
            }),
      ),
      body: Center(
        child: pages[index],
      ),
    );
  }
}
