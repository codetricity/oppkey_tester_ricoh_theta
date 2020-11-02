import 'package:flutter/material.dart';
import 'package:theta_req_res/camera_api/info_button.dart';
import 'package:theta_req_res/camera_api/state_button.dart';
import 'package:theta_req_res/camera_api/take_picture.dart';
import 'package:theta_req_res/windows/request_window.dart';
import 'package:theta_req_res/windows/response_window.dart';
import 'package:theta_req_res/screens/navigation_drawer.dart';
import 'package:theta_req_res/windows/thumb_window.dart';
import 'package:theta_req_res/camera_api/helpers/update_last_file_uri.dart';


class JesseScreen extends StatelessWidget {
  const JesseScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var device = MediaQuery.of(context).size;
    print('On the Jesse screen, the device is ${device.width} pixels wide');
    return Scaffold(
      appBar: AppBar(
        title: Text('Jesse BIG Screen'),
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
                      // create button and then put button on this row
                      // this is the desktop view
                      InfoButton(),
                      StateButton(),
                      InfoButton(),
                      TakePictureButton(),
                      TakePictureButton(),
                    ],
                  )
                // this is the mobile view
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
                            InfoButton(),
                            TakePictureButton(),
                            RaisedButton(
                              onPressed: () {
                                updateLastFileUri(context);
                              },
                              child: Text('Update Image'),
                            ),                          ],
                        ),
                        Expanded(child: Column(
                          children: [
                            ThumbWindow(),
                            Text('This is a new widget'),
                            Expanded(child: ResponseWindow()),
                          ],
                        )),
                        Row(
                          children: [
                            ResponseWindow(),
                          ],
                        )
                      ],
                    ),
                  ),

            device.width > 1000
                ? Row(
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
                : Row()
          ],
        ),
      ),
    );
  }
}
