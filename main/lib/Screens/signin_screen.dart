import 'package:flutter/material.dart';

class SinginScreen extends StatefulWidget {
  const SinginScreen({super.key});

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

class _SinginScreenState extends State<SinginScreen> {
  var emailController = TextEditingController();
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
                Text(
                  "Login",
                ),
                SizedBox(
                  height: 35,
                ),
                TextFormField(
                  controller: emailController,
                ),
              ],
            ))));
  }
}
