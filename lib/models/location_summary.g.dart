// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocationSummaryImpl _$$LocationSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$LocationSummaryImpl(
      name: json['name'] as String? ?? "",
      street: json['street'] as String? ?? "",
      isoCountryCode: json['isoCountryCode'] as String? ?? "",
      country: json['country'] as String? ?? "",
      postalCode: json['postalCode'] as String? ?? "",
      locality: json['locality'] as String? ?? "",
      administrativeArea: json['administrativeArea'] as String? ?? "",
      subAdministrativeArea: json['subAdministrativeArea'] as String? ?? "",
      subLocality: json['subLocality'] as String? ?? "",
      thoroughfare: json['thoroughfare'] as String? ?? "",
      subThoroughfare: json['subThoroughfare'] as String? ?? "",
    );

Map<String, dynamic> _$$LocationSummaryImplToJson(
        _$LocationSummaryImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'street': instance.street,
      'isoCountryCode': instance.isoCountryCode,
      'country': instance.country,
      'postalCode': instance.postalCode,
      'locality': instance.locality,
      'administrativeArea': instance.administrativeArea,
      'subAdministrativeArea': instance.subAdministrativeArea,
      'subLocality': instance.subLocality,
      'thoroughfare': instance.thoroughfare,
      'subThoroughfare': instance.subThoroughfare,
    };
