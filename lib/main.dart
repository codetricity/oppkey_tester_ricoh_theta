import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'package:theta_req_res/notifiers/req_res_notifier.dart';
import 'package:theta_req_res/screens/home/home_screen.dart';
import 'package:theta_req_res/screens/image_screen.dart';
import 'package:theta_req_res/screens/jesse_screen.dart';
import 'package:theta_req_res/screens/status/status_screen.dart';
import 'package:theta_req_res/screens/admin_screen.dart';
import 'package:theta_req_res/screens/files_screen.dart';
import 'package:theta_req_res/screens/sc2_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ResponseNotifier()),
        ChangeNotifierProvider(create: (_) => RequestNotifier()),
        ChangeNotifierProvider(create: (_) => CameraNotifier()),
        ChangeNotifierProvider(create: (_) => ReqResNotifier()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // this disabled the "debug" banner in the upper right
      debugShowCheckedModeBanner: false,
      title: 'Oppkey Tester for RICOH THETA',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.red[300],
        accentColor: Colors.red[800],
        buttonColor: Colors.lightGreen[300],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.light,
      routes: {
        '/': (context) => HomeScreen(),
        '/status': (context) => StatusScreen(),
        '/view': (context) => ImageScreen(),
        '/jesse': (context) => JesseScreen(),
        '/admin': (context) => AdminScreen(),
        '/files': (context) => FilesScreen(),
        '/sc2': (context) => Sc2Screen(),
      },
      initialRoute: '/',
    );
  }
}
