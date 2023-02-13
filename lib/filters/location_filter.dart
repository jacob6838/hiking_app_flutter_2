import 'dart:math';

import 'package:hiking_app/filters/exponential_average_filter.dart';
import 'package:hiking_app/hiking_service.dart';
import 'package:hiking_app/models/location_status.dart';
import 'package:hiking_app/models/location_accuracy_type.dart';

class LocationFilter {
  ExponentialAverageFilter? _latitudeFilter;
  ExponentialAverageFilter? _longitudeFilter;
  ExponentialAverageFilter? _accuracyFilter;
  ExponentialAverageFilter? _altitudeFilter;
  ExponentialAverageFilter? _speedFilter;
  ExponentialAverageFilter? _speedAccuracyFilter;
  ExponentialAverageFilter? _headingFilter;

  LocationFilter(LocationStatus loc) {
    _latitudeFilter = ExponentialAverageFilter(
        loc.latitude, _getVarianceAccuracy(loc.accuracyValue));
    _longitudeFilter = ExponentialAverageFilter(
        loc.longitude, _getVarianceAccuracy(loc.accuracyValue));
    _accuracyFilter =
        ExponentialAverageFilter(loc.accuracy.value.toDouble(), 1);
    _altitudeFilter = ExponentialAverageFilter(
        loc.altitude, _getVarianceAccuracy(loc.accuracyValue * 5));
    _speedFilter = ExponentialAverageFilter(
        loc.speedMetersPerSec, _getVarianceAccuracy(loc.speedAccuracyValue));
    _speedAccuracyFilter =
        ExponentialAverageFilter(loc.speedAccuracy.value.toDouble(), 1);
    _headingFilter = ExponentialAverageFilter(loc.headingDegrees, 1);
  }

  LocationStatus getValue(LocationStatus loc) => LocationStatus(
        latitude: _latitudeFilter!.kalmanFilter(
            loc.latitude, _getVarianceAccuracy(loc.accuracyValue)),
        longitude: _longitudeFilter!.kalmanFilter(
            loc.longitude, _getVarianceAccuracy(loc.accuracyValue)),
        accuracy: toAccuracyType(
            _accuracyFilter!.kalmanFilter(loc.accuracy.value.toDouble(), 1)),
        altitude: _altitudeFilter!.kalmanFilter(
            loc.altitude, _getVarianceAccuracy(loc.accuracy.value * 5)),
        speedMetersPerSec: _speedFilter!.kalmanFilter(loc.speedMetersPerSec,
            _getVarianceAccuracy(loc.speedAccuracyValue)),
        speedAccuracy: toAccuracyType(_speedAccuracyFilter!
            .kalmanFilter(loc.speedAccuracy.value.toDouble(), 1)),
        headingDegrees: _headingFilter!.kalmanFilter(loc.headingDegrees, 1),
        timeStampSec: loc.timeStampSec,
      );

  double _getVarianceAccuracy(double sigma) => pow(sigma, 2.0).toDouble();
}
