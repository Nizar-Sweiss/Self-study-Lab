import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

var emailController = TextEditingController();
var passwordController = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            Text(
              "Login",
            ),
            SizedBox(
              height: 35,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              onChanged: (String value) {
                print(value);
              },
              decoration: InputDecoration(
                labelText: 'Email Address',
                prefixIcon: Icon(
                  Icons.email,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            TextFormField(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (String value) {
                print(value);
              },
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                ),
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                ),
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              width: 200,
              height: 50,
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  "Login",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don\'t Have account ? ",
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "SIGN IN !",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 157, 255),
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ],
        )),
      ),
    );
  }
}
