import 'package:flutter/material.dart';
import 'package:fluttertodo/app_state.dart';
import 'package:provider/provider.dart';

class ResponseDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Container(
      padding: const EdgeInsets.all(16.0),
      child: appState.isFetching
          ? CircularProgressIndicator()
          : appState.getResponseJson() != null
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: appState.getResponseJson().length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        appState.getResponseJson()[index]["name"],
                      ),
                    );
                  },
                )
              : Text("Press Button above to fetch ToDos"),
    );
  }
}
