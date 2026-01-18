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
  factory HourModel.fromCache(Map<String, dynamic> json) {
    return HourModel(
      temp: json['temp_c'],
      image: json['condition']['icon'],
      hour: json['time'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'temp_c': temp,
      'condition': {'icon': image},
      'time': hour,
    };
  }
}
