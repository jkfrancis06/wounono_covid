enum TestResult { TEST_POS, TEST_NEG, TEST_NULL }

class HealthStatus {
  final DateTime testDate;
  final TestResult testSatuts;

  HealthStatus({
    this.testDate, this.testSatuts
  });

}