enum UnitType {
  distance,
  speed,
  unspecified;

  List<Unit> listUnits() {
    switch (this) {
      case UnitType.distance:
        return DistanceUnits.values;
      case UnitType.speed:
        return DistanceUnits.values;
      case UnitType.unspecified:
        return UnspecifiedUnits.values;
    }
  }
}

abstract class Unit {
  double fromDefault(double value);
  String get name;
  UnitType get type;
}

enum DistanceUnits implements Unit {
  m,
  km,
  inch,
  ft,
  mile;

  @override
  UnitType get type => UnitType.distance;

  @override
  double fromDefault(double meters) {
    switch (this) {
      case DistanceUnits.m:
        return meters;
      case DistanceUnits.km:
        return meters / 1000;
      case DistanceUnits.inch:
        return meters / 0.0254;
      case DistanceUnits.ft:
        return meters * 3.2808;
      case DistanceUnits.mile:
        return meters * 3.2808 / 5280;
    }
  }

  @override
  String get name {
    switch (this) {
      case DistanceUnits.m:
        return "m";
      case DistanceUnits.km:
        return "km";
      case DistanceUnits.inch:
        return "in";
      case DistanceUnits.ft:
        return "ft";
      case DistanceUnits.mile:
        return "mi";
    }
  }
}

enum SpeedUnits implements Unit {
  minpmi,
  mph,
  ftps,
  mps,
  kmph;

  @override
  UnitType get type => UnitType.speed;

  @override
  double fromDefault(double mps) {
    switch (this) {
      case SpeedUnits.minpmi:
        return mps.abs() > 0.01 ? (1 / (mps * metersPerSecToMilesPerMin)) : 0;
      case SpeedUnits.mph:
        return mps * 2.23694;
      case SpeedUnits.ftps:
        return mps * 3.2808;
      case SpeedUnits.mps:
        return mps;
      case SpeedUnits.kmph:
        return mps * 3.6;
    }
  }

  @override
  String get name {
    switch (this) {
      case SpeedUnits.minpmi:
        return 'min/mi';
      case SpeedUnits.mph:
        return 'mph';
      case SpeedUnits.ftps:
        return 'ft/s';
      case SpeedUnits.mps:
        return 'm/s';
      case SpeedUnits.kmph:
        return 'km/hr';
    }
  }
}

enum UnspecifiedUnits implements Unit {
  unit;

  @override
  UnitType get type => UnitType.distance;

  @override
  double fromDefault(double unit) {
    return unit;
  }

  @override
  String get name {
    return "";
  }
}

const double feetPerMeter = 3.28084;
const double metersPerSecToMilesPerMin = 0.0372823;
const feetPerMile = 5280;

const int minPerHour = 60;
const int secPerMin = 60;

double metersToFeet(double distance) {
  return distance * feetPerMeter;
}
