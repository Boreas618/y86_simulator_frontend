import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:y86_simulator/provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../provider/data_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void onFileTilePressed() async {
    SettingsProvider settingsProvider = SettingsProvider.getInstance();
    List<String> dataPaths = await DataProvider.loadFileList();
    String? path = await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
              title: const Text("Select a file to visualize"),
              content: Column(
                children: dataPaths
                    .map(
                      (e) => ListTile(
                          title: Text(e),
                          onTap: () async{
                            Navigator.pop(ctx, e);
                          }),
                    )
                    .toList(),
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(ctx, settingsProvider.selected_file_path),
                    child: const Text("cancel")),
              ],
            ));
    settingsProvider.selected_file_path = path;
    settingsProvider.rawData = await DataProvider.loadData(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Y86 Simulator"),
        centerTitle: false,
      ),
      body: Center(
          child: ListView(
        children: [
          Card(
              child: ListTile(
            onTap: onFileTilePressed,
            title: const Text("Selected File"),
            subtitle: Text(SettingsProvider.getInstance().selected_file_path),
          ))
        ],
      )),
    );
  }
}
