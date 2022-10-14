import 'package:firebase_auth/firebase_auth.dart';
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
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 35,
            ),
            TextFormField(
                controller: emailController,
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    labelText: "Your Email or UserName ",
                    labelStyle: TextStyle(color: Color.fromARGB(213, 0, 0, 0)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ))),
            TextFormField(
                controller: passwordController,
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Color.fromARGB(213, 0, 0, 0)),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.password,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ))),
            Container(
              width: 200,
              height: 50,
              child: MaterialButton(
                onPressed: () async {
                  try {
                    var authenticationobject = FirebaseAuth.instance;

                    UserCredential myUser =
                        await authenticationobject.signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text);
                    // ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text("Login successfully")));
                    Navigator.popAndPushNamed(context, "Store");
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
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
                ),
                TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, "SignIn");
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
        )),
      ),
    );
  }
}
