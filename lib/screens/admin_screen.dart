import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'package:theta_req_res/windows/request_window.dart';
import 'package:theta_req_res/windows/response_window.dart';
import 'package:theta_req_res/screens/navigation_drawer.dart';
import 'package:theta_req_res/camera_api/reset_button.dart';
import 'package:theta_req_res/camera_api/power/disable_sleep_button.dart';
import 'package:theta_req_res/camera_api/power/show_sleep_delay_button.dart';
import 'package:theta_req_res/camera_api/power/disable_power_off.dart';
import 'package:theta_req_res/camera_api/power/show_off_delay_button.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin for ${Provider.of<CameraNotifier>(context).model}'),
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          children: [
            // row of buttons to send commands to camera
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DisableSleepButton(),
                ShowSleepDelayButton(),
                DisablePowerOffButton(),
                ShowOffDelayButton(),
                ResetButton(),
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
                Container(
                  width: 300.0,
                  child: Center(
                    child: Text(
                      'Last Image',
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
                  Container(
                    alignment: Alignment.topCenter,
                    width: 300,
                    // child: Image.network('https://i.imgur.com/lk6WHIW.jpg'),
                    child: Image.network(
                        '${Provider.of<CameraNotifier>(context).fileUri}?type=thumb'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
