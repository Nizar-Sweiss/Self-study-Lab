import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        appBar: AppBar(
          title: Text("Sign Up"),
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
                TextFormField(
                  controller: ConformPasswordController,
                ),
                Container(
                  width: 200,
                  height: 50,
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
            ))));
  }
}
