enum MainUnits { metric, imperial }

extension MainUnitsExtension on MainUnits {
  String get name {
    switch (this) {
      case MainUnits.metric:
        return 'metric';
      case MainUnits.imperial:
        return 'freedom';
    }
  }

  String get distanceUnitShort {
    switch (this) {
      case MainUnits.metric:
        return 'km';
      case MainUnits.imperial:
        return 'mi';
    }
  }

  String get distanceUnitLong {
    switch (this) {
      case MainUnits.metric:
        return 'Kilometers';
      case MainUnits.imperial:
        return 'Miles';
    }
  }

  String get elevationUnitShort {
    switch (this) {
      case MainUnits.metric:
        return 'm';
      case MainUnits.imperial:
        return 'ft';
    }
  }

  String get elevationUnitLong {
    switch (this) {
      case MainUnits.metric:
        return 'Meters';
      case MainUnits.imperial:
        return 'Feet';
    }
  }

  String get speedUnitShort {
    switch (this) {
      case MainUnits.metric:
        return 'km/h';
      case MainUnits.imperial:
        return 'mph';
    }
  }

  String get speedUnitLong {
    switch (this) {
      case MainUnits.metric:
        return 'Kilometers per hour';
      case MainUnits.imperial:
        return 'Miles per hour';
    }
  }

  String get paceUnitShort {
    switch (this) {
      case MainUnits.metric:
        return 'min/km';
      case MainUnits.imperial:
        return 'min/mi';
    }
  }

  String get paceUnitLong {
    switch (this) {
      case MainUnits.metric:
        return 'Minutes per kilometer';
      case MainUnits.imperial:
        return 'Minutes per mile';
    }
  }
}

enum SpeedUnitsImperial { minpmi, mph, ftps }

extension SpeedUnitsImperialExtension on SpeedUnitsImperial {
  String get name {
    switch (this) {
      case SpeedUnitsImperial.minpmi:
        return 'min/mi';
      case SpeedUnitsImperial.mph:
        return 'mph';
      case SpeedUnitsImperial.ftps:
        return 'ft/s';
    }
  }
}

enum SpeedUnitsMetric { mps, kmph }

extension SpeedUnitsMetricExtension on SpeedUnitsMetric {
  String get name {
    switch (this) {
      case SpeedUnitsMetric.mps:
        return 'm/s';
      case SpeedUnitsMetric.kmph:
        return 'km/hr';
    }
  }
}
