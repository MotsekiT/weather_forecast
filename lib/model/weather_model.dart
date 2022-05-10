class WeatherData {
  String cityName;
  String countryName;
  String weatherIcon;
  String weatherDescription;
  double temperature;
  double feelsLike;
  double pressure;
  double humidity;
  double windSpeed;
  DateTime sunrise;
  DateTime sunset;
  double longitude;
  double latitude;

  WeatherData(
      {required this.cityName,
      required this.countryName,
      required this.weatherIcon,
      required this.sunrise,
      required this.sunset,
      required this.weatherDescription,
      required this.temperature,
      required this.feelsLike,
      required this.pressure,
      required this.humidity,
      required this.windSpeed,
      required this.longitude,
      required this.latitude});

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      cityName: json['name'],
      countryName: json['sys']['country'],
      weatherIcon: 'http://openweathermap.org/img/wn/' +
          json['weather'].first['icon'] +
          '@2x.png',
      longitude: json['coord']['lon'].toDouble(),
      latitude: json['coord']['lat'].toDouble(),
      sunrise: DateTime.fromMillisecondsSinceEpoch(
          json['sys']['sunrise'].toInt() * 1000 as int,
          isUtc: true),
      sunset: DateTime.fromMillisecondsSinceEpoch(
          json['sys']['sunset'].toInt() * 1000,
          isUtc: true),
      weatherDescription: json['weather'].first['description'],
      temperature: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }
}
