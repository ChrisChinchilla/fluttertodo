import 'package:flutter/material.dart';
import 'package:fluttertodo/app_state.dart';
import 'package:provider/provider.dart';
import 'package:fluttertodo/response_display.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

Future main() async {
  // NOTE: The filename will default to .env and doesn't need to be defined in this case
  await DotEnv.load();
  runApp(ToDoapp());
}

class ToDoapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'To Dos',
        home: ChangeNotifierProvider(
          create: (context) => AppState(),
          child: ToDoList(),
        ));
    // home: ChangeNotifierProvider<AppState>(
    //   builder: (_) => AppState()
    //   child: ToDoList(),
    // ));
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
                ElevatedButton(
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
