import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/utility/random_color.dart';

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
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        shadowColor: Colors.white,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "LOGIN",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Login now to add your personal notes ",
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                  controller: emailController,
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      labelText: "Your Email or UserName ",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(212, 255, 255, 255)),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                  controller: passwordController,
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                            width: 1,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      labelText: "Password",
                      labelStyle:
                          TextStyle(color: Color.fromARGB(212, 255, 255, 255)),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.password,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ))),
            ),
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(
                        20.0) //                 <--- border radius here
                    ),
              ),
              child: MaterialButton(
                onPressed: () async {
                  try {
                    var authenticationobject = FirebaseAuth.instance;
                    await authenticationobject.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passwordController.text);
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text("Login successfully")));
                    //Navigator.popAndPushNamed(context, "Store");
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        backgroundColor: Color.fromARGB(255, 144, 2, 30),
                        content: Text(
                            "Something Went Wrong Check Your Email And Password")));
                  }
                },
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
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "SignIn");
                  },
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
        ),
      ),
    );
  }
}
