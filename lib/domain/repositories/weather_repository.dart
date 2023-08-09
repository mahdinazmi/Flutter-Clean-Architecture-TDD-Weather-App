import 'package:dartz/dartz.dart';
import 'package:weather_clean_architecture_tdd/core/error/failure.dart';
import 'package:weather_clean_architecture_tdd/domain/entities/weather.dart';

abstract class WeatherRepository {
  
  Future<Either<Failure,WeatherEntity>> getCurrentWeather(String cityName);
}