import 'package:flutter/material.dart';

import '../provider/data_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void onFileTilePressed() async{
    List<String> dataPaths = await DataProvider.loadFileList();
    String? rawString = await showDialog(
        context: context,
        builder: (ctx)=>AlertDialog(
          title: const Text("Select a file to visualize"),
          content: Column(
            children: dataPaths.map((e) => ListTile(title: Text(e))).toList(),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text("cancel")),
            TextButton(
                onPressed: (){},
                child: Text("ok"))
          ],
        ));
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
                subtitle: Text("./A.json"),
              )
            )
          ],
        )
      ),
    );
  }
}
