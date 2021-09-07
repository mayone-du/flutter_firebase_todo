import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MainModel extends ChangeNotifier {
  Future getTodoList() async {
    final todos = FirebaseFirestore.instance.collection('todos');
    final snapshot = await todos.get();
    final docs = snapshot.docs;
    print(docs);
  }
}
