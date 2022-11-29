import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:y86_simulator/pages/settings.dart';
import 'package:y86_simulator/providers/settings_provider.dart';
import 'package:y86_simulator/widgets/bottom_bar.dart';
import './pages/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final Map<String, Widget Function(BuildContext)> routes = {
    '/home': (BuildContext context) =>
        DefaultAssetBundle(bundle: rootBundle, child: const MyHomePage()),
    '/settings': (BuildContext context) =>
        DefaultAssetBundle(bundle: rootBundle, child: const SettingsPage()),
  };

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
            value: SettingsProvider.getInstance()..init()),
      ],
      child: MaterialApp(
        title: 'Y86 Simulator',
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
        initialRoute: '/home',
        routes: routes,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Y86 Simulator"),
        centerTitle: false,
      ),
      body: Center(
        child: MainPage(),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
