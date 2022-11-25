import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DataProvider {
  //DataProvider._();

  //static final DataProvider _instance = DataProvider._();

  //factory DataProvider.getInstance() => _instance;

  static Future<List<String>> loadFileList() async {
    String manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final dataPaths =
        manifestMap.keys.where((element) => element.contains(".json")).toList();
    
    return dataPaths;
  }
}
