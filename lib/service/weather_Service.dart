import 'package:dio/dio.dart';
import 'package:weather_app_figma/constance/ProjectConstanc.dart';
import 'package:weather_app_figma/models/Weather_Model.dart';

class WeatherServic {
  final Dio dio;

  WeatherServic(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
        '$baseURL/forecast.json?key=$apiKey&q=$cityName&days=3',
      );

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errMessage =
          e.response?.data['error']['message'] ??
          'oops there was an error , try later';
      throw Exception(errMessage);
    } catch (e) {
      throw Exception('oops there was an error  ');
    }
  }
}
