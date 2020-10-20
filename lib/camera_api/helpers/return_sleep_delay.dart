import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> returnSleepDelay(context) async {
  var url = 'http://192.168.1.1/osc/commands/execute';
  var body = jsonEncode({
    'name': 'camera.getOptions',
    'parameters': {
      'optionNames': ['sleepDelay']
    }
  });
  var response = await http.post(url,
      headers: {"Content-Type": "application/json;charset=utf-8"}, body: body);
  var responseBody = jsonDecode(response.body);
  var sleepDelay = responseBody['results']['options']['sleepDelay'];
  return sleepDelay;
}
