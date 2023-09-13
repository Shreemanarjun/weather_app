import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiKeyPod = StateProvider<String>((ref) {
  const key = String.fromEnvironment('weather_key', defaultValue: "");
  return key;
});
