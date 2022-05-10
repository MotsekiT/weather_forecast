import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/view_models/home_view_model.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    HomePageViewModel viewModel = new HomePageViewModel();
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/pic2.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<HomePageViewModel>(builder: (context, viewModel, child) {
              return Column(
                children: [DetailsView(viewModel, context)],
              );
            })
            //DetailsView(viewModel, context)
          ],
        ),
      ),
    );
  }
}

Widget DetailsView(HomePageViewModel viewModel, BuildContext context) {
  var forecast = viewModel.weatherData;
  var temp = forecast.temperature.toStringAsFixed(1) + "°C";
  Container detailsview = Container(
      child: Column(
    children: [Text(temp)],
  ));

  return detailsview;
}
