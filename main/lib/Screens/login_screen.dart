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
            ),
            TextFormField(
              controller: passwordController,
            ),
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
