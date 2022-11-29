import 'dart:convert';

import '../providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
        builder: (_, settingsProvider, __){
          String rawData = settingsProvider.rawData;
          List<dynamic> frames = jsonDecode(rawData);
          context.read<SettingsProvider>().numberOfFrames = frames.length;
          return Container(
            child: Text(frames[settingsProvider.currentFrame].toString()),
          );
        });
  }
}
