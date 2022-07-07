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
    average = average + K * y;
    variance = (1 - K) * alpha * variance + (1 - alpha) * R; //(1 - K) * variance;
    return average;
  }

  double velocityFilter() {
    return 0.0;
  }
}
