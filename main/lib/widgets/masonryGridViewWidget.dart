import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main/utility/utility.dart';

List colors = [
  Colors.red.shade200,
  Colors.orange.shade200,
  Colors.yellow.shade200,
  Colors.green.shade200,
  Colors.blue.shade200,
];
Color getColor() => (colors..shuffle()).first;

class MasonryGridViewWidget extends StatefulWidget {
  const MasonryGridViewWidget({super.key});

  @override
  State<MasonryGridViewWidget> createState() => _MasonryGridViewWidgetState();
}

class _MasonryGridViewWidgetState extends State<MasonryGridViewWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: notes.snapshots(),
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
                      style: TextStyle(
                        color: Colors.grey.shade900,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      documentSnapshot['description'],
                      maxLines: 30,
                      style:  TextStyle(
                        color: Colors.grey.shade800,
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
