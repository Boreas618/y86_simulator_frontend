import 'package:flutter/material.dart';
import 'package:y86_simulator/providers/settings_provider.dart';
import 'package:provider/provider.dart';

import '../utils/frame_controller.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  void onSettingsPressed() {
    Navigator.pushNamed(context, '/settings');
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
              onPressed: () => context.read<FrameController>().currentFrame++,
              icon: const Icon(Icons.play_circle)),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: onSettingsPressed,
          ),
          Expanded(
              child: ListTile(
            title: Consumer<SettingsProvider>(
              builder: (_, settingsProvider, __) =>
                  Text(context.read<SettingsProvider>().selected_file_path),
            ),
          ))
        ],
      ),
    );
  }
}
