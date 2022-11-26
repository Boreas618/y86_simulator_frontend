import 'dart:convert';

import '../providers/settings_provider.dart';
import 'package:flutter/material.dart';
import '../utils/frame_controller.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key, required FrameController frameController}) : super(key: key);
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {
    return Consumer2<SettingsProvider, FrameController>(
        builder: (_, settingsProvider, frameController, __){
          String rawData = settingsProvider.rawData;
          List<dynamic> frames = jsonDecode(rawData);
          frameController.init(frames.length);
          return Container(
            child: Text(frames[frameController.currentFrame].toString()),
          );
        });
  }
}
