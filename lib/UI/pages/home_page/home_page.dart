import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecast/UI/widgets.dart';
import 'package:weather_forecast/view_models/home_view_model.dart';

import 'home_page_body.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/night.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: ListView(
            children: [
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: const Text(
                  'Hello,',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.only(left: 25),
                child: const Text(
                  'Check the weather by the city',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Consumer<HomePageViewModel>(
                builder: (context, viewModel, child) {
                  if (viewModel.viewModelErrors.loading) {
                    return Container(
                      child: Center(
                        child: CircularProgressIndicator(
                          semanticsLabel:
                              viewModel.viewModelErrors.loadingMessage,
                        ),
                      ),
                    );
                  } else if (viewModel.viewModelErrors.error) {
                    return Center(
                      child: HomePageError(
                          message: viewModel.viewModelErrors.errorMessage),
                    );
                  } else {
                    return Column(
                      children: [textFieldView(), midView(viewModel, context)],
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  textFieldView() {
    return Consumer<HomePageViewModel>(builder: (context, viewModel, child) {
      var inputBorder = OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.white),
      );
      return Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 30,
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Enter the City Name',
            hintStyle: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            border: inputBorder,
            enabledBorder: inputBorder,
            focusedBorder: inputBorder,
            contentPadding: const EdgeInsets.all(8),
          ),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              viewModel.getWeatherData(_cityName);
            });
          },
        ),
      );
    });
  }
}
