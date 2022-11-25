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

  set selected_file_path(String filename) {
    sharedPreferences!.setString(KEY_SELECTED_FILE_PATH, filename);
    notifyListeners();
  }
}
