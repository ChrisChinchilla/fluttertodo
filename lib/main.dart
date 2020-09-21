import 'package:flutter/material.dart';
import 'package:fluttertodo/app_state.dart';
import 'package:provider/provider.dart';
import 'package:fluttertodo/response_display.dart';

void main() {
  runApp(ToDoapp());
}

class ToDoapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To Dos',
        home: ChangeNotifierProvider<AppState>(
          builder: (_) => AppState(),
          child: ToDoList(),
        ));
  }
}

class ToDoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => appState.fetchData(),
                  child: Text("Fetch To Dos"),
                ),
                ResponseDisplay(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}