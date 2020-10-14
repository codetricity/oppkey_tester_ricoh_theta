import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'package:panorama/panorama.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Provider.of<CameraNotifier>(context).appInitialized
            ? Text(
                'Oppkey Tester for RICOH THETA - Showing ${Provider.of<CameraNotifier>(context).fileUri}')
            : Text('Please reconnect your camera'),
      ),
      body: Center(
        child: Panorama(
          child: Image.network(Provider.of<CameraNotifier>(context).fileUri),
          animSpeed: 0.0,
        ),
      ),
    );
  }
}
