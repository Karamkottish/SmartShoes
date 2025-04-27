enum ValCondition { stable, serious, critical }

class Range {
  final int criticalFrom;
  final int criticalTo;
  final int seriousFrom;
  final int seriousTo;
  final int stableFrom;
  final int stableTo;

  const Range({
    this.criticalFrom = 0,
    this.criticalTo = 49,
    this.seriousFrom = 50,
    this.seriousTo = 74,
    this.stableFrom = 75,
    this.stableTo = 100,
  });

  ValCondition getCondition(int val) => isValStable(val)
      ? ValCondition.stable
      : isValSerious(val)
          ? ValCondition.serious
          : ValCondition.critical;

  bool isValCritical(int val) => val >= criticalFrom && val <= criticalTo;

  bool isValSerious(int val) => val >= seriousFrom && val <= seriousTo;

  bool isValStable(int val) => val >= stableFrom && val <= stableTo;
}
