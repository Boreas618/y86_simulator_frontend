import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:y86_simulator/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../providers/data_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  //这是一个回调函数，当设置中的那一项被单击时调用这一函数
  void onFileTilePressed() async {
    //获取存储状态的实例，即instance，可以给我们提供状态信息
    //相关概念：设计模式——单例模式（这里不理解就算了）
    SettingsProvider settingsProvider = context.read<SettingsProvider>();
    //导入可供显示的文件的列表
    List<String> dataPaths = await DataProvider.loadFileList();
    //通过一个对话框来获取待显示文件名称
    //相关概念：异步
    //await其实是在等待对话框被关闭后传回待显示的文件的路径
    String? path = await showDialog(
        //context不理解没关系
        context: context,
        //builder参数：一个构建对话框的匿名绘制函数
        builder: (ctx) =>
            //即对话框本体
            AlertDialog(
              title: const Text("Select a file to visualize"),
              content: Column(
                children: dataPaths
                    .map(
                      (e) =>
                      ListTile(
                          title: Text(e),
                          //点击文件列表的某一个文件，关闭对话框，返回路径信息
                          onTap: () async {
                            //关闭对话框，返回路径信息
                            Navigator.pop(ctx, e);
                          }),
                )
                    .toList(),
              ),
              actions: [
                TextButton(
                    onPressed: () =>
                        Navigator.pop(ctx, settingsProvider.selected_file_path),
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
                      subtitle: Consumer<SettingsProvider>(
                          builder: (_, settingsProvider, __) =>
                              Text(settingsProvider.selected_file_path) ,
                      )
                  ))
            ],
          )),
    );
  }
}
