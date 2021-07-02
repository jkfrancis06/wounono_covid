class VaccineStat {
  final String country;
  final Map timeline;

  VaccineStat({this.country, this.timeline});

  factory VaccineStat.fromJson(Map<String, dynamic> json) {
    return VaccineStat(
      country: json['country'],
      timeline: json['timeline'],
    );
  }

}