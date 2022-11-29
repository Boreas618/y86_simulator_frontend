import 'package:flutter/material.dart';
import 'package:y86_simulator/providers/settings_provider.dart';
import 'package:provider/provider.dart';


class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void onSettingsPressed() {
    Navigator.pushNamed(context, '/settings');
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          SizedBox(width: 10,),
          Consumer<SettingsProvider>(
            builder: (_, __, ___){
              return Text(context.read<SettingsProvider>().currentFrame.toString());
            },
          ),
          IconButton(
              onPressed: (){
                if(context.read<SettingsProvider>().currentFrame == 0){
                  context.read<SettingsProvider>().currentFrame = context.read<SettingsProvider>().numberOfFrames - 1;
                }
                context.read<SettingsProvider>().currentFrame -= 1;
              },
              icon: const Icon(Icons.arrow_back)),
          IconButton(
              onPressed: (){
                if(context.read<SettingsProvider>().currentFrame == context.read<SettingsProvider>().numberOfFrames - 1){
                  context.read<SettingsProvider>().currentFrame = 0;
                }
                context.read<SettingsProvider>().currentFrame += 1;
              },
              icon: const Icon(Icons.arrow_forward)),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: onSettingsPressed,
          ),
          Expanded(
              child: ListTile(
            title: Consumer<SettingsProvider>(
              builder: (_, settingsProvider, __) =>
                  Text(context.read<SettingsProvider>().selected_file_path),
            ),
          ))
        ],
      ),
    );
  }
}
