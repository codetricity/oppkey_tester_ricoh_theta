import 'dart:convert';

String formatJson(String input) {
  const JsonDecoder decoder = JsonDecoder();
  const JsonEncoder encoder = JsonEncoder.withIndent('  ');
  final dynamic object = decoder.convert(input);
  final dynamic prettyString = encoder.convert(object);
  // prettyString.split('\n').forEach((dynamic element) => print(element));
  return prettyString;
}
