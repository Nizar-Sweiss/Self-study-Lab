import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:main/utility/utility.dart';

final TextEditingController _titleController = TextEditingController();
final TextEditingController _descriptionController = TextEditingController();
final cardColor = getColor();
Future<void> createOrUpdate(context,
    [DocumentSnapshot? documentSnapshot]) async {
  String action = 'create';
  if (documentSnapshot != null) {
    action = 'update';
    _titleController.text = documentSnapshot['title'];
    _descriptionController.text = documentSnapshot['description'];
  }
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: AlertDialog(
          backgroundColor: cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: SizedBox(
            height: 300,
            width: 100,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        maxLines: 1,
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        controller: _titleController,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade900),
                          ),
                          hintText: 'Title',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        maxLines: 30,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.done,
                        controller: _descriptionController,
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey.shade900),
                          ),
                          hintText: 'Note',
                        ),
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 75,
                  child: Container(
                    width: 80,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: IconButton(
                      icon: const FaIcon(FontAwesomeIcons.pen),
                      iconSize: 20,
                      color: cardColor,
                      onPressed: () async {
                        final String title = _titleController.text;
                        final String description = _descriptionController.text;
                        if (_titleController.text.isNotEmpty &&
                            _descriptionController.text.isNotEmpty) {
                          if (action == 'create') {
                            await notes.add(
                              {
                                "title": title,
                                "description": description,
                              },
                            );
                          }
                          if (action == 'update') {
                            await notes.doc(documentSnapshot!.id).update(
                              {
                                "title": title,
                                "description": description,
                              },
                            );
                          }
                          _titleController.text = '';
                          _descriptionController.text = '';
                          Navigator.of(context).pop();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

Future<void> deleteNote(context, String noteID) async {
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: AlertDialog(
          backgroundColor: Colors.grey.shade900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          content: SizedBox(
            height: 300,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Are you sure you wan't to delete this note?",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade600,
                        fixedSize: const Size(100, 50),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        fixedSize: const Size(100, 50),
                      ),
                      onPressed: () {
                        notes.doc(noteID).delete();
                        Navigator.of(context).pop();
                      },
                      child: const Text("Delete"),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
