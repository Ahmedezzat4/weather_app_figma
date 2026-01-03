import 'package:weather_app_figma/models/OneDay_Model.dart';
import 'package:weather_app_figma/models/OneHour_model.dart';

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
}
