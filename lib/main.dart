import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_todo/main_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  dynamic sample = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'TODOアプリ',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider<MainModel>(
          create: (_) => MainModel()..getTodoList(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(sample.toString()),
            ),
            body: Consumer<MainModel>(
              builder: (context, model, child) {
                final todoList = model.todoList;
                return ListView(
                  children: todoList
                      .map((todo) => ListTile(
                            title: Text(todo.title),
                            // createdAt: todo.createdAt,
                          ))
                      .toList(),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                // コレクション内のドキュメント一覧を取得
                final snapshot = await FirebaseFirestore.instance
                    .collection('todoList')
                    .get();

                sample = snapshot;
                print(snapshot.docs[0]);

                // FireStoreにデータを追加
                // FirebaseFirestore.instance
                //     .collection('todoList')
                //     .doc()
                //     .set({'title': '散歩行く'});
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          ),
        ));
  }
}
