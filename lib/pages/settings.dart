import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  void onFileTilePressed() async{
    String? rawString = await showDialog(
        context: context,
        builder: (_)=>Dialog(
          child: Center(
            child: Text("Dialog"),
          ),
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
