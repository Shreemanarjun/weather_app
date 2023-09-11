import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiKeyPod = Provider.autoDispose<String>((ref) {
  const key =
      String.fromEnvironment('weather_key', defaultValue: "no value given");
  return key;
});
