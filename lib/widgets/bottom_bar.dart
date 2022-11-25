import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget{
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  void onHomePressed(){
    return;
  }

  void onSettingsPressed(){
    return;
  }

  @override
  Widget build(BuildContext context){
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: onHomePressed,
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: onSettingsPressed,
          )
        ],
      ),
    );
  }
}