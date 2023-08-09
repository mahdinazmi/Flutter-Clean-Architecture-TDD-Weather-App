import 'package:equatable/equatable.dart';
import 'package:weather_clean_architecture_tdd/domain/entities/weather.dart';

abstract class WeatherState extends Equatable {
  const WeatherState();

  @override
  List<Object?> get props => [];
}

class WeatherEmpty extends WeatherState {}

class WeatherLoading extends WeatherState {}

class WeatherLoaded extends WeatherState {
  final WeatherEntity result;

  const WeatherLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

class WeatherLoadFailue extends WeatherState {
  final String message;

  const WeatherLoadFailue(this.message);

  @override
  List<Object?> get props => [message];
}