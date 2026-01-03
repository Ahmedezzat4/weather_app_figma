import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_figma/cubit/get_weather_cubit.dart';
import 'package:weather_app_figma/pages/get_start_page.dart';
import 'package:weather_app_figma/pages/set_location.dart';
import 'package:weather_app_figma/widgets/Forcast_Widget.dart';
import 'package:weather_app_figma/widgets/Today_Widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(primarySwatch: Colors.blue),
              // home: const GetStartPage(),
              initialRoute: '/get_start_page',
              routes: {
                '/get_start_page': (context) => const GetStartPage(),
                '/today_page': (context) => Today_Widget(),
                '/forecast_page': (context) => Forcast_Widget(),
                '/set_location': (context) => SetLocation(),
              },
            );
          },
        ),
      ),
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