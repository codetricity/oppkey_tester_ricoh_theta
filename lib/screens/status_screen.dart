import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'package:theta_req_res/camera_api/info_button.dart';
import 'package:theta_req_res/camera_api/state_button.dart';
import 'package:theta_req_res/camera_api/take_picture.dart';
import 'package:theta_req_res/windows/request_window.dart';
import 'package:theta_req_res/windows/response_window.dart';
import 'package:theta_req_res/screens/navigation_drawer.dart';
import 'package:theta_req_res/camera_api/helpers/update_last_file_uri.dart';
import 'package:theta_req_res/camera_api/test_button.dart';
import 'package:theta_req_res/windows/thumb_window.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // this variable is needed to get the size of the device
    var device = MediaQuery.of(context).size;
    print('On the Status screen, the device is ${device.width} pixels wide');
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Status of ${Provider.of<CameraNotifier>(context).model} - ' +
                'battery: ${Provider.of<CameraNotifier>(context).battery}'),
        actions: [
          IconButton(
            icon: Icon(Icons.battery_full),
            onPressed: () {},
            tooltip: '${Provider.of<CameraNotifier>(context).battery}',
          )
        ],
      ),
      drawer: NavigationDrawer(),
      body: Center(
        child: Column(
          children: [
            // row of buttons to send commands to camera
            device.width > 1000
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InfoButton(),
                      StateButton(),
                      TakePictureButton(),
                      RaisedButton(
                        onPressed: () {
                          updateLastFileUri(context);
                        },
                        child: Text('Update Image'),
                      ),
                      TestButton(),
                    ],
                  )
                // This is the mobile view
                // This was where the TODO was
                : Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InfoButton(),
                            StateButton(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            TakePictureButton(),
                            RaisedButton(
                              onPressed: () {
                                updateLastFileUri(context);
                              },
                              child: Text('Update Image'),
                            ),
                          ],
                        ),
                        Container(child: ThumbWindow()),
                        Container(height: 300.0, child: ResponseWindow())
                      ],
                    ),
                  ),
            // This is the end of the mobile view
            device.width > 1000
                ? Row(
                    children: [
                      Container(
                        width: 300.0,
                        child: Center(
                          child: Text(
                            'Response',
                            style: TextStyle(fontSize: 28),
                          ),
                        ),
                      ),
                      // Container(
                      //   width: 300.0,
                      //   child: Center(
                      //     child: Text(
                      //       'Last Image',
                      //       style: TextStyle(fontSize: 28),
                      //     ),
                      //   ),
                      // ),
                    ],
                  )
                : Row(),
            SizedBox(
              height: 12,
            ),
            // request, response, and image windows
            device.width > 1000
                ? Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RequestWindow(),
                        ResponseWindow(),
                        ThumbWindow(),
                      ],
                    ),
                  )
                : Row(),
          ],
        ),
      ),
    );
  }
}
