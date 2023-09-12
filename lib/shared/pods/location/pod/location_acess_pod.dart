import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/shared/pods/location/notifier/location_access_notifier.dart';

final locationAccessPod =
    AsyncNotifierProvider.autoDispose<LocationAccessNotifier, bool>(
        LocationAccessNotifier.new,
        name: 'locationAccessPod');
