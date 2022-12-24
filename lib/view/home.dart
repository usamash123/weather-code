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
    getWeatherCity();
  }

  var data;
  WeatherModel? selectedWeather;

  getWeatherCity() async {
    var data = await ApiManager.getWeather(" ${citycontroller.text.isNotEmpty ? citycontroller.text: 'lahore'} ");
    selectedWeather = WeatherModel.fromJson(data);
    print(selectedWeather);
    setState(() {});
    
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          getWeatherCity();
        }),
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
                    ElevatedButton.icon(onPressed: (){
                      getWeatherCity();
                    }, icon: Icon(Icons.ads_click), label: Text("Fetch weather") ),
                    Row(
                      children: [
                        customtext("${citycontroller.text}"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         selectedWeather == null? CircularProgressIndicator.adaptive():
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
