import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/router/route_manager.dart';
import 'package:weather_forecast/view_models/home_view_model.dart';

class HomePageError extends StatelessWidget {
  String message;
  HomePageError({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text(message)),
          TextButton(
              onPressed: () {
                Provider.of<HomePageViewModel>(context, listen: false)
                    .viewModelErrors
                    .stopError();
              },
              child: Text("Search")),
        ],
      ),
    );
  }
}
