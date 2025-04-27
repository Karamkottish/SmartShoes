enum SensorLocation {
  LTO,
  LTH,
  LLO,
  LLH,
  LFO,
  LFH,
  RTO,
  RTH,
  RLO,
  RLH,
  RFO,
  RFH
}

enum UnitInfo {
  o2Rate("O2 Rate", "%/spo2"),
  heartBeat("Heart Beat", "BPM");

  const UnitInfo(this.type, this.unit);

  final String type;
  final String unit;
}