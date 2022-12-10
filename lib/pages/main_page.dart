import 'dart:convert';

import '../providers/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/data_tile.dart';
import '../utils/change_checker.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String? rawData;
  List<dynamic>? frames;
  int? regToBeChanged;
  int? memToBeChanged;
  int regCount = -1;
  int memCount = -1;

  @override
  void initState() {
    super.initState();
    rawData = SettingsProvider.getInstance().rawData;
    frames = jsonDecode(rawData ?? '[]');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      SettingsProvider.getInstance().numberOfFrames = frames?.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(builder: (context, settingsProvider, _) {
      regToBeChanged = ChangeChecker.checkChange(
          frames, SettingsProvider.getInstance().currentFrame, CheckType.REG);
      memToBeChanged = ChangeChecker.checkChange(
          frames, SettingsProvider.getInstance().currentFrame, CheckType.MEM);
      return Column(
        children: [
          ListTile(
            title: Center(
              child: Text("STATE INFO"),
            ),
          ),
          Container(
              child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: DataTile(
                          "CC",
                          frames?[SettingsProvider.getInstance().currentFrame]
                              ['CC'],
                          TileType.Regular,
                          false)),
                  Flexible(
                      flex: 1,
                      child: DataTile(
                          "STAT",
                          frames?[SettingsProvider.getInstance().currentFrame]
                              ['STAT'],
                          TileType.Regular,
                          false)),
                  Flexible(
                      flex: 1,
                      child: DataTile(
                          "INS",
                          frames?[SettingsProvider.getInstance().currentFrame]
                              ['INS'],
                          TileType.Regular,
                          false)),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      flex: 1,
                      child: DataTile(
                          "NUM",
                          (frames?[SettingsProvider.getInstance().currentFrame]
                                  ['NUM'])
                              .toString(),
                          TileType.Regular,
                          false)),
                  Flexible(
                      flex: 1,
                      child: DataTile(
                          "PC",
                          (frames?[SettingsProvider.getInstance().currentFrame]
                                  ['PC'])
                              .toString(),
                          TileType.Regular,
                          false)),
                ],
              ),
            ],
          )),
          Divider(),
          Row(
            children: [
              Flexible(
                  flex: 1,
                  child: ListTile(
                      title: Center(
                    child: Text("REG"),
                  ))),
              Flexible(
                  flex: 1,
                  child: ListTile(
                      title: Center(
                    child: Text("MEM"),
                  ))),
            ],
          ),
          Expanded(
              child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                    child: Column(
                      children:
                          frames?[SettingsProvider.getInstance().currentFrame]
                                  ['REG']
                              .keys
                              .toList()
                              .map((e) {
                                regCount++;
                                if (regCount % 15== regToBeChanged) {
                                  return DataTile(
                                      e,
                                      frames?[SettingsProvider.getInstance()
                                          .currentFrame]['REG'][e],
                                      TileType.Hex,
                                      true);
                                } else {
                                  return DataTile(
                                      e,
                                      frames?[SettingsProvider.getInstance()
                                          .currentFrame]['REG'][e],
                                      TileType.Hex,
                                      false);
                                }
                              })
                              .toList()
                              .cast<Widget>(),
                    ),
                  )),
              Flexible(
                  flex: 1,
                  child: SingleChildScrollView(
                      child: Column(
                    children:
                        frames?[SettingsProvider.getInstance().currentFrame]
                                ['NZ_MEM']
                            .keys
                            .toList()
                            .map((e) {
                              memCount++;
                              if (memCount % 20== memToBeChanged) {
                                return DataTile(
                                    e,
                                    frames?[SettingsProvider.getInstance()
                                        .currentFrame]['NZ_MEM'][e],
                                    TileType.Hex,
                                    true);
                              } else {
                                return DataTile(
                                    e,
                                    frames?[SettingsProvider.getInstance()
                                        .currentFrame]['NZ_MEM'][e],
                                    TileType.Hex,
                                    false);
                              }
                            })
                            .toList()
                            .cast<Widget>()
                  ))),
            ],)
          )
        ],
      );
    });
  }
}
