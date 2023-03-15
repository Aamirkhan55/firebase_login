import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/read_data/get_name.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  List<String> docId = [];

  Future getDocId() async {
    await FirebaseFirestore.instance
    .collection('users')
    .orderBy('age', descending: false)
    .get()
    .then((snapshot) 
     => snapshot.docs.forEach((element) { 
        print(element.reference);
        docId.add(element.reference.id);
      })
     );
  }

  @override
  void initState() {
    super.initState();
    getDocId();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () async{
              await FirebaseAuth.instance.signOut();
            }, 
            icon: const Icon(Icons.logout)
            )
        ],
      ),
      body: Column(
        children:  [
        Expanded(
          child: FutureBuilder(
            future: getDocId(),
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: docId.length,
                itemBuilder: (context, index) {
                  return ListTile(
                     title: GetUserName(documentId: docId[index]),
                     tileColor: Colors.grey[400],
                     trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                        ),
                      onPressed: () async{
                        await FirebaseFirestore.instance.collection('users').doc().delete();
                      },
                      ),
                  );
                });
            }
            ),
          ),
        ]
      ),
    );
  }
}