class CalculateCgpa {
  final int gpa1;
  final int gpa2;
  final int creditUnit1;
  final int creditUnit2;

  late final double _cgpa;
  late final double _gpa;
  late final double _units;

  CalculateCgpa({
    required this.creditUnit1,
    required this.creditUnit2,
    required this.gpa1,
    required this.gpa2,
  });

  void addGpa() {
    _gpa = (gpa1 + gpa2) as double;
  }

  void addUnits() {
    _units = (creditUnit1 + creditUnit2) as double;
  }

  String calculateCgpa() {
    _cgpa = _gpa / _units;
    return _cgpa.toStringAsFixed(2);
  }
}
