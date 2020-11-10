import 'package:http_auth/http_auth.dart' as http_auth;

import './client_info.dart';

void main() {
  var client = http_auth.DigestAuthClient('THETAYN10010104', '10010104');

  final url = 'http://192.168.2.200/osc/info';

  client.get(url).then((r) => print(r.body));
  // getInfo();
}
