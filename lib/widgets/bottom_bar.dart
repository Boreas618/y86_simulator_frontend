import 'package:flutter/material.dart';
import 'package:y86_simulator/provider/settings_provider.dart';

class BottomBar extends StatefulWidget{
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  void onSettingsPressed(){
    Navigator.pushNamed(context, '/settings');
  }

  @override
  Widget build(BuildContext context){
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: onSettingsPressed,
          ),
          Expanded(
              child: ListTile(
                title: Text(SettingsProvider.getInstance().selected_file_path),
              ))
        ],
      ),
    );
  }
}