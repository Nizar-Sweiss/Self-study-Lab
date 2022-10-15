import 'package:flutter/material.dart';
import 'package:main/utility/utility.dart';
import 'package:main/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Future<void> _deleteProduct(String productId) async {
  //   await _notes.doc(productId).delete();
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 17, 17, 17),
      bottomNavigationBar: BottomNavigationBarWidget(),
      appBar: AppBarWidget(context),
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
