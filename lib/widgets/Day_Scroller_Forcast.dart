import 'package:flutter/material.dart';
import 'package:weather_app_figma/models/Weather_Model.dart';
import 'package:weather_app_figma/widgets/One_day_widget.dart';

class DaysScroller extends StatefulWidget {
  final WeatherModel weatherModel;

  const DaysScroller({super.key, required this.weatherModel});
  @override
  State<DaysScroller> createState() => _DaysScrollerState();
}

class _DaysScrollerState extends State<DaysScroller> {
  final ScrollController _scrollController = ScrollController();

  double scrollAmount = 77;

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + scrollAmount,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - scrollAmount,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // سهم الشمال
        SizedBox(
          height: 20,
          width: 30,
          child: IconButton(
            padding: EdgeInsets.only(left: 8),
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: scrollLeft,
          ),
        ),

        // المنطقة اللي فيها الأيام
        Expanded(
          // height: 168,
          child: SingleChildScrollView(
            padding: EdgeInsets.zero,
            controller: _scrollController,
            scrollDirection: Axis.horizontal,

            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(7, (index) {
                final realIndex =
                    index % widget.weatherModel.firstSevenDays.length;
                final item = widget.weatherModel.firstSevenDays[realIndex];
                return One_Day_Widget(
                  degree: item.temp.toString(),
                  day: item.day,
                  imagePath: item.image,
                );
              }),
            ),

            //   One_Day_Widget(
            //     degree:widget.weatherModel.firstSevenDays[0].temp.toString(),
            //     day:dayParth( widget.weatherModel.firstSevenDays[0].day) ,
            //     imagePath: widget.weatherModel.firstSevenDays[0].image,
            //     mid_background_color: Color(0xff673C95),
            //     end_background_color: Color(0xff8F4CA2),
            //   ),
            //   One_Day_Widget(
            //     degree: '21',
            //     day: 'Tue',
            //     imagePath: 'assets/images/Sun cloud mid rain.png',
            //   ),
            //   One_Day_Widget(
            //     degree: '22',
            //     day: 'Wed',
            //     imagePath: 'assets/images/Sun cloud mid rain.png',
            //   ),
            //   One_Day_Widget(
            //     degree: '24',
            //     day: 'Thu',
            //     imagePath: 'assets/images/Sun cloud mid rain.png',
            //   ),
            //   One_Day_Widget(
            //     degree: '20',
            //     day: 'Fri',
            //     imagePath: 'assets/images/Sun cloud mid rain.png',
            //   ),
            //   One_Day_Widget(
            //     degree: '18',
            //     day: 'Sat',
            //     imagePath: 'assets/images/Sun cloud mid rain.png',
            //   ),
            //   One_Day_Widget(
            //     degree: '19',
            //     day: 'Sun',
            //     imagePath: 'assets/images/Sun cloud mid rain.png',
            //   ),
          ),
        ),

        // سهم اليمين
        SizedBox(
          height: 20,
          width: 30,
          child: IconButton(
            padding: EdgeInsets.only(right: 8),
            icon: Icon(Icons.arrow_forward_ios, color: Colors.white),
            onPressed: scrollRight,
          ),
        ),
      ],
    );
  }
}
