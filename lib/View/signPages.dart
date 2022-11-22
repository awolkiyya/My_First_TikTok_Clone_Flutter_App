import 'package:flutter/material.dart';
import 'package:my_tiktok/Widgets/testfield.dart';
import 'package:my_tiktok/colors.dart';

class SignPage extends StatelessWidget {
  SignPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'TikTok Clone',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(height: 10.0),
            Text(
              'Register New ',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700),
            ),
            Divider(
              color: Color.fromARGB(255, 44, 36, 36),
              height: 50.0,
              indent: 100.0,
              endIndent: 100.0,
              thickness: 2.0,
            ),
            SizedBox(height: 5.0),
            Container(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 64,
                      backgroundColor: Colors.black,
                      backgroundImage: NetworkImage(
                          'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                    ),
                    Positioned(
                      top: 80.0,
                      left: 70.0,
                      child: IconButton(
                        onPressed: () => {
                          authController.pickImage(),
                        },
                        icon: Icon(
                          Icons.camera_alt_sharp,
                          color: Color.fromARGB(255, 245, 243, 243),
                          size: 40.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.0,
                ),
                TestField(
                  controller: _userNameController,
                  labelText: 'User Name',
                  icons: Icons.people_alt_rounded,
                  obsCure: false,
                ),
                SizedBox(height: 15.0),
                TestField(
                  controller: _emailController,
                  labelText: 'Email',
                  icons: Icons.email_rounded,
                  obsCure: false,
                ),
                SizedBox(height: 15.0),
                TestField(
                  controller: _passwordController,
                  labelText: 'Password',
                  icons: Icons.password,
                  obsCure: true,
                ),
              ],
            )),
            SizedBox(height: 20.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 247, 64, 64),
                padding: EdgeInsets.symmetric(horizontal: 100),
              ),
              onPressed: () => {
                authController.registerUser(
                    _userNameController.text,
                    _emailController.text,
                    _passwordController.text,
                    authController.profilePhoto),
              },
              child: Text(
                "Registor",
                style: TextStyle(
                    color: Color.fromARGB(255, 249, 247, 247),
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "I have account",
                  style: TextStyle(color: Color.fromARGB(255, 13, 13, 13)),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    elevation: 0.0,
                  ),
                  onPressed: () => {
                    Navigator.pop(context),
                  },
                  child: Text(
                    'login',
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
