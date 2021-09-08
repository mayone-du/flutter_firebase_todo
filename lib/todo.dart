import 'package:cloud_firestore/cloud_firestore.dart';

class Todo {
  Todo(DocumentSnapshot doc) {
    this.title = doc.data().toString();
    this.createdAt = DateTime.now();
  }

  String title = "";
  DateTime? createdAt = DateTime.now();
}
