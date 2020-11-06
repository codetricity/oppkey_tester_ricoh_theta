import 'package:theta_req_res/windows/req_res_window.dart';
import 'package:flutter/material.dart';
import 'package:theta_req_res/camera_api/info_button.dart';
import 'package:theta_req_res/camera_api/state_button.dart';
import 'package:theta_req_res/camera_api/take_picture.dart';
import 'package:theta_req_res/camera_api/helpers/update_last_file_uri.dart';
import 'package:theta_req_res/windows/thumb_window.dart';

class StatusMobileScreen extends StatelessWidget {
  const StatusMobileScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150,
          child: GridView.count(
            padding: const EdgeInsets.all(10),
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            childAspectRatio: 4,
            shrinkWrap: true,
            children: [
              InfoButton(),
              StateButton(),
              TakePictureButton(),
              UpdateLastFileUriButton(),
            ],
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Container(child: ThumbWindow()),
        Container(height: 200.0, child: ReqResWindow())
      ],
    );
  }
}

class UpdateLastFileUriButton extends StatelessWidget {
  const UpdateLastFileUriButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        updateLastFileUri(context);
      },
      child: Text('Update Image'),
    );
  }
}
