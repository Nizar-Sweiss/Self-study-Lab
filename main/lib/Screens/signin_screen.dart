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
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        labelText: "Your Email or UserName ",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(213, 0, 0, 0)),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ))),
                TextFormField(
                    controller: passwordController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        labelText: "Password",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(213, 0, 0, 0)),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(
                          Icons.password,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ))),
                TextFormField(
                    controller: ConformPasswordController,
                    style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                        ),
                        labelText: "Conform Password",
                        labelStyle:
                            TextStyle(color: Color.fromARGB(213, 0, 0, 0)),
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
