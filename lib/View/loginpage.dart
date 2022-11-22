import 'package:flutter/material.dart';
import 'package:my_tiktok/Controllers/auth.dart';
import 'package:my_tiktok/View/signPages.dart';
import 'package:my_tiktok/Widgets/testfield.dart';
import 'package:my_tiktok/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
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
              'Login',
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 30.0,
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
                padding: EdgeInsets.symmetric(horizontal: 150),
              ),
              onPressed: () => {
                authController.loginUser(
                    _emailController.text, _passwordController.text),
              },
              child: Text(
                "Login",
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
                  "I don\'t have account",
                  style: TextStyle(
                      color: Color.fromARGB(255, 13, 13, 13), fontSize: 15.0),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 255, 255, 255),
                    elevation: 0.0,
                  ),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignPage(),
                      ),
                    ),
                  },
                  child: Text(
                    'Register Here',
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
