import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_figma/constance/ProjectConstanc.dart';
import 'package:weather_app_figma/cubit/get_weather_cubit.dart';
import 'package:weather_app_figma/cubit/location_search_cubit.dart';
import 'package:weather_app_figma/cubit/selected_city_cubit.dart';
import 'package:weather_app_figma/models/CityName_model.dart';

class SetLocation extends StatelessWidget {
  const SetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController cityController = TextEditingController();

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: colorsOfPage,
            begin: Alignment.topLeft, // Start from the top-left
            end: Alignment.bottomRight,
            // End at the bottom-right
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 150),
                SizedBox(height: 120),
                Text(
                  'Set  Location',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 199, 196, 196),
                    fontSize: 32,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'Please Set city name  to get weather\ninformation for your area.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: TextField(
                    controller: cityController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Enter city name',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 20,
                      ),
                    ),
                    onChanged: (value) {
                      context.read<SelectedCityCubit>().clear();
                      context.read<LocationSearchCubit>().searchCity(value);
                    },
                  ),
                ),
                BlocBuilder<LocationSearchCubit, List<CityModel>>(
                  builder: (context, cities) {
                    if (cities.isEmpty) return const SizedBox();

                    return Container(
                      margin: const EdgeInsets.only(
                        top: 8,
                        left: 32,
                        right: 32,
                      ),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 228, 218, 218),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cities.take(4).length,
                        itemBuilder: (context, index) {
                          final city = cities[index];

                          return ListTile(
                            title: Text('${city.name}, ${city.country}'),
                            onTap: () {
                              cityController.text = city.name;

                              // نخزن المدينة المختارة (مهم)
                              context.read<SelectedCityCubit>().selectCity(
                                city,
                              );

                              // نقفل الريكومنديشن
                              context.read<LocationSearchCubit>().clear();

                              // نقفل الكيبورد
                              FocusScope.of(context).unfocus();
                            },
                          );
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 60),
                SizedBox(
                  height: 60,
                  width: 220,
                  child: BlocBuilder<SelectedCityCubit, CityModel?>(
                    builder: (context, selectedCity) {
                      return ElevatedButton(
                        onPressed: selectedCity == null
                            ? null
                            : () {
                                context.read<GetWeatherCubit>().getWeather(
                                  cityName: selectedCity.name,
                                );

                                Navigator.pushNamed(context, todayPageRoute);
                                // context.read<GetWeatherCubit>().getWeather(
                                //   cityName: cityController.text,
                                // );

                                // Navigator.pushNamed(context, todayPageRoute);
                                // // Handle location permission request
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff624FA4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          'Set Location',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
