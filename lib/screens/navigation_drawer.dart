import 'package:flutter/material.dart';
import 'package:theta_req_res/camera_api/helpers/update_battery_level.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/camera_notifier.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(
            title: Text('Status'),
            onTap: () {
              Navigator.pushNamed(context, '/status');
            },
          ),
          ListTile(
            title: Text('View'),
            onTap: () {
              updateBatteryLevel(context);
              Navigator.pushNamed(context, '/view');
            },
          ),
          ListTile(
            title: Text('Files'),
            onTap: () {
              Navigator.pushNamed(context, '/files');
            },
          ),
          ListTile(
            title: Text('Admin'),
            onTap: () {
              Navigator.pushNamed(context, '/admin');
            },
          ),
          Provider.of<CameraNotifier>(context).model == 'RICOH THETA SC2'
              ? ListTile(
                  title: Text('SC2'),
                  onTap: () {
                    Navigator.pushNamed(context, '/sc2');
                  },
                )
              : Container(),
          ListTile(
            title: Text('Jesse'),
            onTap: () {
              Navigator.pushNamed(context, '/jesse');
            },
          ),
        ],
      ),
    );
  }
}
