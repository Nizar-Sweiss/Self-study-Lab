import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main/utility/utility.dart';
import 'package:main/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  // Future<void> _deleteProduct(String productId) async {
  //   await _notes.doc(productId).delete();
  // }
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    String action = 'create';
    if (documentSnapshot != null) {
      action = 'update';
      _titleController.text = documentSnapshot['title'];
      _descriptionController.text = documentSnapshot['description'];
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (BuildContext ctx) {
        return Padding(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'title',
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'description',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                child: Text(action == 'create' ? 'Create' : 'Update'),
                onPressed: () async {
                  final String title = _titleController.text;
                  final String description = _descriptionController.text;
                  if (action == 'create') {
                    await notes.add({
                      "title": title,
                      "description": description,
                    });
                  }
                  if (action == 'update') {
                    await notes.doc(documentSnapshot!.id).update({
                      "title": title,
                      "description": description,
                    });
                  }
                  _titleController.text = '';
                  _descriptionController.text = '';
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      bottomNavigationBar: BottomNavigationBarWidget(),
      appBar: AppBarWidget(),
      body: Column(
        children: [
          Text(auth.currentUser!.email.toString()),
          TextButton(
            onPressed: () {
              auth.signOut();
            },
            child: const Text("Sign-out"),
          ),
          const Expanded(
            child: MasonryGridViewWidget(),
          ),
        ],
      ),
      // Add new product
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _createOrUpdate(),
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
