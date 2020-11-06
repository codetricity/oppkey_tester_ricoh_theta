import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'package:theta_req_res/screens/navigation_drawer.dart';
import 'package:theta_req_res/screens/status/status_mobile_screen.dart';
import 'package:theta_req_res/screens/status/status_desktop_screen.dart';

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
        child:
            device.width > 1000 ? StatusDesktopScreen() : StatusMobileScreen(),
      ),
    );
  }
}
