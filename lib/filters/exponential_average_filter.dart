class ExponentialAverageFilter {
  double average;
  double variance;
  double alpha = 0.5;

  ExponentialAverageFilter(this.average, this.variance);

  // z = measured average, R = measured variance
  double kalmanFilter(double z, double R) {
    double y = z - average; // innovation
    double S = variance + R;
    double K = variance / S;
    print("PRE  Kalman Filter: {average: $average, variance: $variance, z: $z, R: $R, K: $K}");
    average = average + K * y;
    variance = R; //alpha * variance + (alpha - 1) * R; //(1 - K) * variance;
    print("POST Kalman Filter: {average: $average, variance: $variance}");
    return average;
  }

  double velocityFilter() {
    return 0.0;
  }
}
