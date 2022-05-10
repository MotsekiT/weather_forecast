import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather_forecast/router/route_manager.dart';
import '../../../view_models/home_view_model.dart';

Widget midView(HomePageViewModel viewModel, BuildContext context) {
  var forecast = viewModel.weatherData;
  var cityName = forecast.cityName;
  var country = forecast.countryName;
  var humTemp = forecast.humidity.toStringAsFixed(1) + '%';
  var feelsTemp = forecast.temperature.toStringAsFixed(1) + '°';
  var descripDetails = forecast.weatherDescription.toUpperCase();
  var temp = forecast.temperature.toStringAsFixed(1) + "°C";
  var long = forecast.longitude.toStringAsFixed(1);
  var lati = forecast.latitude.toStringAsFixed(1);

  Container midView = Container(
    child: Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$cityName, $country',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 25),
              Text(
                'L: $long, L: $lati',
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          Column(
            children: [
              CachedNetworkImage(
                imageUrl: viewModel.weatherData.weatherIcon,
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                temp,
                style: const TextStyle(fontSize: 28, color: Colors.white),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(descripDetails,
                  style: const TextStyle(fontSize: 35, color: Colors.white)),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        'FEELSLIKE',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      Text(
                        feelsTemp,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Text(
                        'HUMIDITY',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.white),
                      ),
                      Text(
                        humTemp,
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(RouteManager.detailsPage);
                  },
                  child: Text("View details")),
            ],
          ),
        ],
      ),
    ),
  );
  return midView;
}
