import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geocoding/geocoding.dart';

part 'location_summary.freezed.dart';
part 'location_summary.g.dart';

@freezed
class LocationSummary with _$LocationSummary {
  const LocationSummary._();
  const factory LocationSummary({
    @Default("") String name,
    @Default("") String street,
    @Default("") String isoCountryCode,
    @Default("") String country,
    @Default("") String postalCode,
    @Default("") String locality,
    @Default("") String administrativeArea,
    @Default("") String subAdministrativeArea,
    @Default("") String subLocality,
    @Default("") String thoroughfare,
    @Default("") String subThoroughfare,
  }) = _LocationSummary;

  LocationSummary fromPlacemark(Placemark placemark) {
    return LocationSummary(
      name: placemark.name ?? "",
      street: placemark.street ?? "",
      isoCountryCode: placemark.isoCountryCode ?? "",
      country: placemark.country ?? "",
      postalCode: placemark.postalCode ?? "",
      locality: placemark.locality ?? "",
      administrativeArea: placemark.administrativeArea ?? "",
      subAdministrativeArea: placemark.subAdministrativeArea ?? "",
      subLocality: placemark.subLocality ?? "",
      thoroughfare: placemark.thoroughfare ?? "",
      subThoroughfare: placemark.subThoroughfare ?? "",
    );
  }

  factory LocationSummary.fromJson(Map<String, dynamic> json) =>
      _$LocationSummaryFromJson(json);
}
