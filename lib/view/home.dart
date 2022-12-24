import 'package:flutter/material.dart';

import 'package:weather_app/controller/api_manager.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/view/widgtes.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  final citycontroller = TextEditingController();
  void initState() {
    super.initState();
    getweathercity();
  }

  var data;
  WeatherModel? selectedWeather;

  getweathercity() async {
    var data = await ApiManager.getWeather("lahore");

    selectedWeather = WeatherModel.fromJson(data);
    setState(() {});
    
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: size.height / 2,
              decoration: BoxDecoration(
                  // image: DecorationImage(image: AssetImage("assets/images/weather.jpeg"), fit: BoxFit.cover)
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    customtext(
                      "Weather Forcasting",
                    ),
                    Center(
                      child: Container(
                        height: 50,
                        width: size.width / 1.2,
                        child: customtxtfld(citycontroller),
                      ),
                    ),
                    Row(
                      children: [
                        customtext("${citycontroller.text}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //  selectWeather== null? CircularProgressIndicator.adaptive():
                        customtext("${selectedWeather!.main!.temp}°C")
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
