import 'package:flutter/material.dart';

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
              Navigator.pushNamed(context, '/view');
            },
          ),
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
