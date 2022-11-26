import 'package:flutter/material.dart';
import 'package:y86_simulator/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  //The constructor method
  SettingsProvider._();

  //Why 'static final'? Why not single 'static'
  static final _instance = SettingsProvider._();

  //factory method. I don't understand :-(
  factory SettingsProvider.getInstance() => _instance;

  SharedPreferences? sharedPreferences;

  static const String KEY_SELECTED_FILE_PATH = "selected_file_path";
  static const String KEY_RAW_DATA = "raw_data";

  Future<void> init() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  String get selected_file_path {
    if (sharedPreferences!.containsKey(KEY_SELECTED_FILE_PATH)) {
      String? filename = sharedPreferences!.getString(KEY_SELECTED_FILE_PATH);
      if (filename == null) {
        return Constant.base_path;
      } else {
        return Constant.base_path +
            sharedPreferences!.getString(KEY_SELECTED_FILE_PATH)!;
      }
    }
    return "";
  }

  set selected_file_path(String? filename) {
    if(filename != null){
      sharedPreferences!.setString(KEY_SELECTED_FILE_PATH, filename!);
    } else if(sharedPreferences!.containsKey(KEY_SELECTED_FILE_PATH)){
      sharedPreferences!.remove(KEY_SELECTED_FILE_PATH);
    }
    notifyListeners();
  }

  String get rawData {
    if(sharedPreferences!.containsKey(KEY_RAW_DATA)){
      return sharedPreferences!.getString(KEY_RAW_DATA) ?? "[]";
    }
    return "[]";
  }

  set rawData(String? data){
    if(data != null){
      sharedPreferences!.setString(KEY_RAW_DATA, data);
    } else if(sharedPreferences!.containsKey(KEY_RAW_DATA)){
      sharedPreferences!.remove(KEY_RAW_DATA);
    }
    notifyListeners();
  }
}
