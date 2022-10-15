import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/utility/random_color.dart';

class SinginScreen extends StatefulWidget {
  const SinginScreen({super.key});

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

class _SinginScreenState extends State<SinginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var ConformPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Register",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Sign up now to add your personal notes ",
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
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      labelText: "Your Email or UserName ",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                  controller: passwordController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.white,
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                  controller: ConformPasswordController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(width: 1, color: Colors.white),
                      ),
                      labelText: "Conform Password",
                      labelStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(
                        Icons.password,
                        color: Colors.white,
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

                    UserCredential myUser = await authenticationobject
                        .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Signed In successfully")));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "Something Went Wrong Check Your Email Or Password")));
                  }
                },
                child: Text(
                  "Sign up",
                ),
              ),
            ),
          ],
        )));
  }
}
