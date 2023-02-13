// ignore_for_file: constant_identifier_names

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hiking_app/settings_defaults.dart';
import 'package:kt_dart/collection.dart';

import 'models/units.dart';

class SecureStorageService {
  static const _storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true));

  static const String UNITS_KEY = "UNITS";

  init() async {
    if ((await retrieveUnits()).isEmpty()) {
      return await saveUnits(SettingsDefaults.units);
    }
    return;
  }

  saveUnits(KtMap<String, Unit> val) async =>
      await _storage.write(key: UNITS_KEY, value: json.encode(val));

  Future<KtMap<String, Unit>> retrieveUnits() async =>
      ((await _storage.read(key: UNITS_KEY) ?? {}) as Map<String, Unit>)
          .toImmutableMap();
}
