import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app_figma/models/Weather_Model.dart';

class WeatherLocalStorage {
  static const _key = 'cached_weather';

  Future<void> cacheWeather(WeatherModel model) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode(model.toJson()));
  }

  Future<WeatherModel?> getCachedWeather() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);

    if (data == null) return null;

    return WeatherModel.fromCache(jsonDecode(data));
  }
}
