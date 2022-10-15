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
                        keyboardType: TextInputType.multiline,
                        textInputAction: TextInputAction.next,
                        controller: _titleController,
                        decoration: const InputDecoration(
                          hintText: 'Title',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        maxLines: 30,
                        controller: _descriptionController,
                        decoration: const InputDecoration(
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
