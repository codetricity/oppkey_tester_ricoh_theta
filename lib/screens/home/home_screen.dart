import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'package:theta_req_res/notifiers/response_notifier.dart';
import 'package:theta_req_res/camera_api/start_button.dart';
import 'package:theta_req_res/screens/home/home_screen_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    print('device is ${device.width} pixels wide');
    return Scaffold(
      appBar: AppBar(
        title: Provider.of<CameraNotifier>(context).appInitialized
            ? Text('Oppkey Tester for RICOH THETA - ' +
                ' Currently testing a ${Provider.of<CameraNotifier>(context).model}')
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
              width: double.infinity,
              child: Text(
                Provider.of<ResponseNotifier>(context).responseText,
                style: TextStyle(fontSize: 20),
              ),
            ),
            device.width > 1000
                ? Row(
                    children: [
                      Image.asset('assets/images/camera.png'),
                      SizedBox(
                        width: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          HomeText(),
                        ],
                      ),
                    ],
                  )
                : Row(
                    children: [
                      HomeText(),
                    ],
                  ),
            // request, response
          ],
        ),
      ),
    );
  }
}
