class Competition {
  final String endDate;
  final int totalSeconds;

  Competition({required this.endDate, required this.totalSeconds});

  factory Competition.fromJson(Map<String, dynamic> json) {
    return Competition(
      endDate: json['end_date'] ?? '',
      totalSeconds: json['total_seconds'] ?? 0,
    );
  }
}
