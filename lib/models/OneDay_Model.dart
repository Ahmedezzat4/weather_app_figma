class DayModel {
  final String day;
  final String image;
  final int temp;

  DayModel({required this.day, required this.image, required this.temp});

  factory DayModel.fromJson(json) {
    return DayModel(
      day: json['date'],
      image: json['day']['condition']['icon'],
      temp: (json['day']['avgtemp_c']).toInt(),
    );
  }
}
