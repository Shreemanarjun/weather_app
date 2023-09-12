import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final locationEnableStreamPod = StreamProvider.autoDispose<ServiceStatus>(
  (ref) {
    return Geolocator.getServiceStatusStream()..listen((event) {});
  },
  name: 'locationEnableStreamPod',
);
