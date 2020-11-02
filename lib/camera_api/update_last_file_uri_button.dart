import 'package:flutter/material.dart';
import 'package:theta_req_res/camera_api/helpers/update_last_file_uri.dart';

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
