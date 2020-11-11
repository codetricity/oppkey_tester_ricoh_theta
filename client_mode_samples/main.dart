import 'package:http_auth/http_auth.dart' as http_auth;

void main() async {
  // var client = http_auth.DigestAuthClient('THETAYN10010104', '10010104');
  // final url = 'http://192.168.2.200/osc/info';
  var client = http_auth.DigestAuthClient('user', 'passwd');
  final url = 'http://httpbin.org/digest-auth/auth/user/passwd';

  try {
    var response = await client.get(url);
    print('status code: ${response.statusCode}');
    print('\nrequest\n${response.request}');
    print('\nheaders\n${response.headers}');
    print('\nbody\n${response.body}');
  } catch (e) {
    print(e);
  }
}
