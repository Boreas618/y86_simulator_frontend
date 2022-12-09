import 'dart:convert';

import '../providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/data_item.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late List<dynamic> frames;
  late String rawData;

  void initState() {
    super.initState();
    rawData = context.read<SettingsProvider>().rawData;
    frames = jsonDecode(rawData);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SettingsProvider>().numberOfFrames = frames.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Row(
      children: [
        Flexible(
            flex: 1,
            child: Column(
              children: frames[context.read<SettingsProvider>().currentFrame]
                      ['REG']
                  .keys
                  .toList()
                  .map((e) => DataItem(
                      e,
                      frames[context.read<SettingsProvider>().currentFrame]
                          ['REG'][e]))
                  .toList()
                  .cast<Widget>(),
            )),
        Flexible(flex: 3, child: Container())
      ],
    ));
  }
}
