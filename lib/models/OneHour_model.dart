class HourModel {
  final int temp;
  final String image;
  final String hour;

  HourModel({required this.temp, required this.image, required this.hour});

  factory HourModel.fromJson(json) {
    return HourModel(
      temp: (json['temp_c']).toInt(),
      image: json['condition']['icon'],
      hour: json['time'],
    );
  }
}
