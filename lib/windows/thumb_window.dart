import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';

class ThumbWindow extends StatelessWidget {
  const ThumbWindow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: 300,
      height: 150,
      // child: Image.network('https://i.imgur.com/lk6WHIW.jpg'),
      child: ListView(children: [
        Image.network(
            '${Provider.of<CameraNotifier>(context).fileUri}?type=thumb'),
      ]),
    );
  }
}
