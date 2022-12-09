import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:y86_simulator/pages/settings.dart';
import 'package:y86_simulator/providers/settings_provider.dart';
import 'package:y86_simulator/widgets/bottom_bar.dart';
import './pages/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SettingsProvider.getInstance().init().then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //这里定义了该程序前前端的两个主要界面，home和settings
  //路由与导航https://flutter.cn/docs/development/ui/navigation
  //每一项是一个 字符串->页面 的对应关系，我们通过字符串来生成某一页面
  //页面外面包裹的DefaultAssetBundle暂且不管，主要是用来导入待显示的文件用的
  static final Map<String, Widget Function(BuildContext)> routes = {
    '/home': (BuildContext context) =>
        DefaultAssetBundle(bundle: rootBundle, child: const MyHomePage()),
    '/settings': (BuildContext context) =>
        DefaultAssetBundle(bundle: rootBundle, child: const SettingsPage()),
  };

  @override
  Widget build(BuildContext context) {
    //Provider是状态管理的重要概念。
    //何为状态管理？ 例如，我们将App的语言设置为中文，"中文"就是一个状态；我们将待显示的json文件选为default.json，这也是一种状态。
    //这里用到了MultiProvider，是Provider的一种。
    //状态管理参考https://flutter.cn/docs/development/data-and-backend/state-mgmt/simple
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: SettingsProvider.getInstance()),
      ],
      child: MaterialApp(
        title: 'Y86 Simulator',
        theme: ThemeData(
            //这里面主要配置了App的一些主题参数
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.green)),
        //初始界面：home，参考上面定义的routes
        initialRoute: '/home',
        //采用的路由表，即上面定义的routes
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
    //这里面就是主页的主要成份
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
