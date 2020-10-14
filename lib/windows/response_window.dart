import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/response_notifier.dart';

class ResponseWindow extends StatelessWidget {
  const ResponseWindow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: SingleChildScrollView(
        child: Text(Provider.of<ResponseNotifier>(context).responseText),
      ),
    );
  }
}
