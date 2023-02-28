import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http_demo/apis/api.dart';
import 'package:http_demo/models/todo.dart';

void main() => runApp(const TodoApp());


class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoListApp(),
    );
  }
}

class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key});

  @override
  _TodoListAppState createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  List<Todo> list = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo List"),
      ),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, position) {
          return ListTile(title: Text(list[position].title!));
        },
      ),
    );
  }

  getTodos() {
    Api.getTodos().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        this.list = list.map((model) => Todo.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getTodos();
  }
}