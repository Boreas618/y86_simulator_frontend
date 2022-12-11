import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider extends ChangeNotifier {
  //新建一个状态条目的方法
  //仿照之前的写法写get和set

  //The constructor method
  SettingsProvider._();

  //Why 'static final'? Why not single 'static'
  static final _instance = SettingsProvider._();

  //factory method. I don't understand :-(
  factory SettingsProvider.getInstance() => _instance;

  SharedPreferences? sharedPreferences;

  static const String KEY_SELECTED_FILE_PATH = "selected_file_path";
  static const String KEY_RAW_DATA = "raw_data";
  static const String KEY_CURRENT_FRAME = "current_frame";
  static const String KEY_NUMBER_OF_FRAMES = "number_of_frames";

  Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String get selectedFilePath {
    if (sharedPreferences!.containsKey(KEY_SELECTED_FILE_PATH)) {
      String? filename = sharedPreferences!.getString(KEY_SELECTED_FILE_PATH);
      if (filename == null) {
        return "";
      } else {
        return sharedPreferences!.getString(KEY_SELECTED_FILE_PATH)!;
      }
    }
    return "";
  }

  set selectedFilePath(String? filename) {
    if (filename != null) {
      sharedPreferences!.setString(KEY_SELECTED_FILE_PATH, filename);
    } else if (sharedPreferences!.containsKey(KEY_SELECTED_FILE_PATH)) {
      sharedPreferences!.remove(KEY_SELECTED_FILE_PATH);
    }
    notifyListeners();
  }

  String get rawData {
    if (sharedPreferences!.containsKey(KEY_RAW_DATA)) {
      return sharedPreferences!.getString(KEY_RAW_DATA) ?? "[]";
    }
    return "[]";
  }

  set rawData(String? data) {
    if (data != null) {
      sharedPreferences!.setString(KEY_RAW_DATA, data);
    } else if (sharedPreferences!.containsKey(KEY_RAW_DATA)) {
      sharedPreferences!.remove(KEY_RAW_DATA);
    }
    notifyListeners();
  }

  int get currentFrame {
    if (sharedPreferences!.containsKey(KEY_CURRENT_FRAME)) {
      return sharedPreferences!.getInt(KEY_CURRENT_FRAME) ?? 0;
    }
    return 0;
  }

  set currentFrame(int? data) {
    if (data != null) {
      sharedPreferences!.setInt(KEY_CURRENT_FRAME, data);
    } else if (sharedPreferences!.containsKey(KEY_CURRENT_FRAME)) {
      sharedPreferences!.remove(KEY_CURRENT_FRAME);
    }
    notifyListeners();
  }

  int get numberOfFrames {
    if (sharedPreferences!.containsKey(KEY_NUMBER_OF_FRAMES)) {
      return sharedPreferences!.getInt(KEY_NUMBER_OF_FRAMES) ?? 0;
    }
    return 0;
  }

  set numberOfFrames(int? data) {
    if (data != null) {
      sharedPreferences!.setInt(KEY_NUMBER_OF_FRAMES, data);
    } else if (sharedPreferences!.containsKey(KEY_NUMBER_OF_FRAMES)) {
      sharedPreferences!.remove(KEY_NUMBER_OF_FRAMES);
    }
    notifyListeners();
  }
}
