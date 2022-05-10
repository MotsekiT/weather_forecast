import 'package:flutter/cupertino.dart';
import 'package:weather_forecast/model/weather_model.dart';
import 'package:weather_forecast/services/weather_data_service.dart';
import './view_model_errors.dart';

class HomePageViewModel with ChangeNotifier {
  late ViewModelErrors viewModelErrors;
  late WeatherData weatherData;
  late WeatherDataService weatherService;

  HomePageViewModel() {
    viewModelErrors = ViewModelErrors(notifyListeners: notifyListeners);
    weatherData = WeatherData(
      cityName: "Welkom",
      countryName: "",
      weatherIcon: "",
      sunrise: DateTime.now(),
      sunset: DateTime.now(),
      temperature: 0.0,
      weatherDescription: "",
      feelsLike: 0.0,
      humidity: 0.0,
      pressure: 0.0,
      longitude: 0.0,
      latitude: 0.0,
      windSpeed: 0.0,
    );

    weatherService = WeatherDataService();

    getWeatherData('welkom');
  }

  void getWeatherData(String name) async {
    viewModelErrors.startLoading('Please wait...');

    try {
      weatherData = await weatherService.getWeather(name);
      viewModelErrors.stopLoading();
    } catch (e) {
      viewModelErrors.stopLoading();
      viewModelErrors.startError(e.toString());
    }
  }
}
