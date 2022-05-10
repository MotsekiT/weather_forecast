import 'package:flutter/material.dart';
import 'package:weather_forecast/UI/pages/home_page/home_page.dart';
import '../UI/details_page.dart';

class RouteManager {
  static const String homePage = '/';
  static const String detailsPage = '/detalsPage';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );

      case detailsPage:
        return MaterialPageRoute(
          builder: (context) => DetailsPage(),
        );

      default:
        throw ('Check pages. The one you used does not exist!');
    }
  }
}
