//import 'package:http/http.dart';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:weather_forecast/util/forecast_util.dart';
import '../model/weather_model.dart';

class WeatherDataService {
  static String appId = '21591be989674e15ad358f2d593fc892';

  Future<WeatherData> getWeather(String name) async {
    late Response response;
    var finalUrl = 'https://api.openweathermap.org/data/2.5/weather?q=' +
        name +
        '&units=metric&appid=' +
        appId +
        '';

    try {
      response = await get(Uri.parse(finalUrl));
    } on SocketException {
      throw ('Service Error: ${response.statusCode}');
    }

    print('Url: ${Uri.encodeFull(finalUrl)}');
    print("Data service");

    if (response.statusCode == 200) {
      print('Weather data: ${response.body}');
      return WeatherData.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      throw ("City: $name not found");
    } else if (response.statusCode == 400) {
      throw ("Invalid search. Please search again");
    }

    throw ('Service Error: ${response.statusCode}');
  }
}
