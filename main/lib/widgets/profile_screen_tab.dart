import 'package:flutter/material.dart';
import 'package:main/utility/utility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: non_constant_identifier_names
ProfileScreenWidget() {
  return Center(
    child: Container(
      height: 350,
      width: 250,
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
      decoration: BoxDecoration(
        color: getColor(),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            spreadRadius: 1,
            blurRadius: 5,
            color: Colors.black12,
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Profile',
                style: TextStyle(
                  color: Colors.grey.shade900,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Account: ${auth.currentUser!.email.toString()}",
                style: TextStyle(
                  color: Colors.grey.shade800,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  fixedSize: const Size(100, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  auth.signOut();
                },
                child: const Text("Sign-out"),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    ),
  );
}
