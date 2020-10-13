import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/windows/response_window.dart';
import 'package:theta_req_res/camera_api/start_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Provider.of<CameraNotifier>(context).appInitialized
            ? Text(
                'Oppkey Tester for RICOH THETA - Currently testing a ${Provider.of<CameraNotifier>(context).model}')
            : Text('Press start to begin'),
      ),
      body: Center(
        child: Column(
          children: [
            // row of buttons to send commands to camera
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                StartButton(),
              ],
            ),
            SizedBox(
              height: 12,
            ),
            Container(
              height: 200,
              child: Text(
                Provider.of<ResponseNotifier>(context).responseText,
                style: TextStyle(fontSize: 20),
              ),
            ),
            // request, response
          ],
        ),
      ),
    );
  }
}
