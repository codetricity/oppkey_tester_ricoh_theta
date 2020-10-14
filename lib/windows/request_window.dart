import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/request_notifier.dart';

class RequestWindow extends StatelessWidget {
  const RequestWindow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: SingleChildScrollView(
        child: Text(Provider.of<RequestNotifier>(context).requestText),
      ),
    );
  }
}
