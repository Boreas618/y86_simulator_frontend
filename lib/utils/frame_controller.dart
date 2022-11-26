import 'package:flutter/material.dart';

class FrameController extends ChangeNotifier{

  FrameController._();

  static final _instance = FrameController._();

  factory FrameController.getInstance() => _instance;

  void init(int sz){
    index = 0;
    size = sz;
  }

  int get currentFrame{
    return index;
  }

  set currentFrame(int i){
    index = i;
    notifyListeners();
  }


  static late int index;
  static late int size;

  void nextFrame(){
    try{
      index++;
      notifyListeners();
      if(index >= size){
        throw Error();
      }
    } catch(e){
      index = 0;
      notifyListeners();
    }

  }
}