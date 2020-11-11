/// https://whereisdarran.com/2019/01/tips-and-tricks-with-flutter-httpclient/
import 'dart:io';

HttpClient getHttpClient(String userName, String password) {
  HttpClient client = new HttpClient()
    ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) => true);
  client.authenticate = (uri, scheme, realm) {
    client.addCredentials(
        uri, realm, new HttpClientDigestCredentials(userName, password));
    return new Future.value(true);
  };
  return client;
}
