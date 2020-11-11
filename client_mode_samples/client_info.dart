import 'package:http_auth/http_auth.dart' as http_auth;

void getInfo() async {
  // var client = http_auth.DigestAuthClient('THETAYN10010104', '10010104');
  // final url = 'http://192.168.2.200/osc/info';
  var client = http_auth.DigestAuthClient('user', 'passwd');
  final url = 'http://httpbin.org/digest-auth/auth/user/passwd';

  client.get(url).then((response) {
    print('getting response');
    print(response.statusCode);
    throw ('did not get response');
  }).catchError((e) {
    print(e);
  });
}
