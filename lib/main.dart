import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/router/route_manager.dart';
import 'package:weather_forecast/view_models/home_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomePageViewModel(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: RouteManager.onGenerateRoute,
        initialRoute: RouteManager.homePage,
      ),
    );
  }
}
