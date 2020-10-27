import 'package:flutter/material.dart';

class HomeText extends StatelessWidget {
  const HomeText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Before you begin, please connect\n' +
              'your computer to your \nRICOH THETA camera with Wi-Fi\n',
          style: TextStyle(fontSize: 20),
        ),
        Text('If you are unable to connect,\n' +
            'you can reset the camera Wi-Fi by \n' +
            'pressing and holding down the Wi-Fi \n' +
            'button for 18 seconds\n'),
        Text(
            'Oppkey Tester for RICOH THETA\ninfo@oppkey.com\ncommunity info - https://theta360.guide'),
      ],
    );
  }
}
