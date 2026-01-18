import 'package:weather_app_figma/models/OneDay_Model.dart';
import 'package:weather_app_figma/models/OneHour_Model.dart';

class WeatherModel {
  final String name;
  final String image;
  final String currentDate;
  final int temperature;
  final String weatherCondition;
  final int maxTemp;
  final int minTemp;
  final String sunrise;
  final String sunset;
  final double uv;
  final List<HourModel> firstFourHours;
  final List<DayModel> firstSevenDays;
  WeatherModel({
    required this.name,
    required this.image,
    required this.currentDate,
    required this.temperature,
    required this.weatherCondition,
    required this.maxTemp,
    required this.minTemp,
    required this.sunrise,
    required this.sunset,
    required this.uv,
    required this.firstFourHours,
    required this.firstSevenDays,
  });
  factory WeatherModel.fromJson(json) {
    final hours = json['forecast']['forecastday'][0]['hour'];
    final dayes = json['forecast']['forecastday'];
    List<HourModel> fourHours = hours
        .skip(15)
        .take(4) // هنا خد أول 4 ساعات فقط
        .map<HourModel>((h) => HourModel.fromJson(h))
        .toList();
    List<DayModel> sevenDays = dayes
        .skip(0)
        .take(3) // هنا خد أول 4 ساعات فقط
        .map<DayModel>((d) => DayModel.fromJson(d))
        .toList();
    return WeatherModel(
      name: json['location']['name'],
      image: json['current']['condition']['icon'],
      currentDate: json['location']['localtime'],
      temperature: json['current']['temp_c'].toInt(),
      weatherCondition: json['current']['condition']['text'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'].toInt(),
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'].toInt(),
      sunrise: json['forecast']['forecastday'][0]['astro']['sunrise'],
      sunset: json['forecast']['forecastday'][0]['astro']['sunset'],
      uv: json['current']['uv'],
      firstFourHours: fourHours,
      firstSevenDays: sevenDays,
    );
  }
  factory WeatherModel.fromCache(Map<String, dynamic> json) {
    return WeatherModel(
      name: json['name'],
      image: json['image'],
      currentDate: json['currentDate'],
      temperature: json['temperature'],
      weatherCondition: json['weatherCondition'],
      maxTemp: json['maxTemp'],
      minTemp: json['minTemp'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      uv: json['uv'],
      firstFourHours: (json['firstFourHours'] as List)
          .map((e) => HourModel.fromCache(e))
          .toList(),
      firstSevenDays: (json['firstSevenDays'] as List)
          .map((e) => DayModel.fromCache(e))
          .toList(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'currentDate': currentDate,
      'temperature': temperature,
      'weatherCondition': weatherCondition,
      'maxTemp': maxTemp,
      'minTemp': minTemp,
      'sunrise': sunrise,
      'sunset': sunset,
      'uv': uv,
      'firstFourHours': firstFourHours.map((h) => h.toJson()).toList(),
      'firstSevenDays': firstSevenDays.map((d) => d.toJson()).toList(),
    };
  }
}
