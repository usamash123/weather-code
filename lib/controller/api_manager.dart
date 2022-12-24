import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/controller/api_key.dart';

class ApiManager {
  static const baseurl = "https://api.openweathermap.org/data/2.5/weather";

  static getWeather(city) async {
     var url = "$baseurl?q=$city&appid=$ApiKey";

    try {
      var Response = await http.get(Uri.parse(url));
      var responseData = jsonDecode(Response.body);
      return responseData;
    } catch (e) {
      print(e);
    }
  }
}
