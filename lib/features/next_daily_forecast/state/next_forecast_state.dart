import 'package:weather_app/data/model/nextforecast_model.dart';

sealed class NextForeCastState {
  const NextForeCastState();
}

class GettingLocation implements NextForeCastState {
  const GettingLocation();
}

class LocationError implements NextForeCastState {
  final String error;
  LocationError({
    required this.error,
  });

  @override
  String toString() => 'LocationError(error: $error)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocationError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;
}

class GettingForeCastData extends NextForeCastState {}

class ForeCastData extends NextForeCastState {
  final NextForeCastModel nextForeCastModel;

  ForeCastData({required this.nextForeCastModel});
}

class ForeCastError extends NextForeCastState {
  final String error;

  ForeCastError({required this.error});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ForeCastError && other.error == error;
  }

  @override
  int get hashCode => error.hashCode;

  @override
  String toString() => 'ForeCastError(error: $error)';
}
