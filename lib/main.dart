import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';
import 'package:theta_req_res/camera_api/info_button.dart';
import 'package:theta_req_res/camera_api/state_button.dart';
import 'package:theta_req_res/windows/request_window.dart';
import 'package:theta_req_res/windows/response_window.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ResponseNotifier()),
        ChangeNotifierProvider(create: (_) => RequestNotifier()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'THETA Req Res',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          title: Text('THETA Req Res'),
        ),
        body: Center(
          child: Column(
            children: [
              // row of buttons to send commands to camera
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InfoButton(),
                  StateButton(),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 300.0,
                    child: Center(
                      child: Text(
                        'Request',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  Container(
                    width: 300.0,
                    child: Center(
                      child: Text(
                        'Response',
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              // request, response, and image windows
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RequestWindow(),
                    ResponseWindow(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
