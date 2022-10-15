// main.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List colors = [
  Colors.red.shade100,
  Colors.orange.shade100,
  Colors.yellow.shade100,
  Colors.green.shade100,
  Colors.blue.shade100,
];
Color getColor() => (colors..shuffle()).first;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final CollectionReference _notes = FirebaseFirestore.instance.collection(
    'notes-${FirebaseAuth.instance.currentUser!.uid}',
  );

  //----------- DELETE FUNCTION -----------//
  // Future<void> _deleteProduct(String productId) async {
  //   await _notes.doc(productId).delete();
  // }

  //----------- CREATE OR UPDATE FUNCTION -----------//
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
              // prevent the soft keyboard from covering text fields
              bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
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
                    await _notes.add({
                      "title": title,
                      "description": description,
                    });
                  }
                  if (action == 'update') {
                    await _notes.doc(documentSnapshot!.id).update({
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

  //----------- SCREEN UI -----------//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      // Using StreamBuilder to display all products from Firestore in real-time
      body: Column(
        children: [
          Text(_auth.currentUser!.email.toString()),
          TextButton(
            onPressed: () {
              _auth.signOut();
            },
            child: const Text("Sign-out"),
          ),
          Expanded(
            child: _streamBuilderWidget(),
          ),
        ],
      ),
      // Add new product
      floatingActionButton: FloatingActionButton(
        onPressed: () => _createOrUpdate(),
        child: const Icon(Icons.add),
      ),
    );
  }

  _streamBuilderWidget() {
    return StreamBuilder(
      stream: _notes.snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
        if (streamSnapshot.hasData) {
          return MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            padding: const EdgeInsets.all(10),
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (context, index) {
              final DocumentSnapshot documentSnapshot =
                  streamSnapshot.data!.docs[index];
              return Container(
                padding: const EdgeInsets.all(15),
                constraints: const BoxConstraints(
                  minHeight: 150,
                ),
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
                  children: [
                    Text(
                      documentSnapshot['title'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      documentSnapshot['description'],
                      maxLines: 30,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              );
            },
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
