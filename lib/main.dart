import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_figma/constance/ProjectConstanc.dart';
import 'package:weather_app_figma/cubit/get_weather_cubit.dart';
import 'package:weather_app_figma/cubit/location_search_cubit.dart';
import 'package:weather_app_figma/cubit/selected_city_cubit.dart';
import 'package:weather_app_figma/date/local/weather_local_storage.dart';
import 'package:weather_app_figma/pages/get_start_page.dart';
import 'package:weather_app_figma/pages/set_location.dart';
import 'package:weather_app_figma/widgets/Forcast_Widget.dart';
import 'package:weather_app_figma/widgets/Today_Widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SelectedCityCubit()),
        BlocProvider(create: (context) => LocationSearchCubit()),
        BlocProvider(
          create: (context) => GetWeatherCubit(WeatherLocalStorage()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather ',
      theme: ThemeData(primarySwatch: Colors.blue),
      // home: const GetStartPage(),
      initialRoute: todayPageRoute,
      routes: {
        getStartPageRoute: (context) => const GetStartPage(),
        todayPageRoute: (context) => Today_Widget(),
        forecastPageRoute: (context) => Forcast_Widget(),
        setLocationRoute: (context) => SetLocation(),
      },
    );
  }
}
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => GetWeatherCubit(),
//       child: Builder(builder: (context) => BlocBuilder<GetWeatherCubit, GetWeatherState>(
//             builder: (context, state) {
//       return: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         theme: ThemeData(primarySwatch: Colors.blue),
//         home: const GetStartPage()    ,
//       ;)
//         }, 
//       ),
//     );)
//   }     
// }