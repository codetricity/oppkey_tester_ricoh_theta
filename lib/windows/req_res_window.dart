import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:theta_req_res/notifiers/req_res_notifier.dart';

class ReqResWindow extends StatelessWidget {
  const ReqResWindow({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: SingleChildScrollView(
        child: Text(Provider.of<ReqResNotifier>(context).reqResText),
      ),
    );
  }
}
