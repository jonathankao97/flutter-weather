import 'package:flutter_weather/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_weather/blocs/blocs.dart';
import 'package:flutter_weather/repositories/repositories.dart';
import 'package:http/http.dart' as http;
import 'app.dart';
import 'package:flutter/material.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();

  final WeatherRepository weatherRepository = WeatherRepository(
    weatherApiClient: WeatherApiClient(
      httpClient: http.Client(),
    ),
  );

  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
        BlocProvider<SettingsBloc>(create: (context) => SettingsBloc())
      ],
      child: App(
        weatherRepository: weatherRepository,
      )));
}
