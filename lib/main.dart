import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'package:theta_req_res/screens/home_screen.dart';
import 'package:theta_req_res/screens/jesse_screen.dart';
import 'package:theta_req_res/screens/status_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ResponseNotifier()),
        ChangeNotifierProvider(create: (_) => RequestNotifier()),
        ChangeNotifierProvider(create: (_) => CameraNotifier()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Oppkey Tester for RICOH THETA',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      routes: {
        '/': (context) => HomeScreen(),
        '/status': (context) => StatusScreen(),
        '/jesse': (context) => JesseScreen(),
      },
      initialRoute: '/',
    );
  }
}
