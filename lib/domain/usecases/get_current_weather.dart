import 'package:dartz/dartz.dart';
import 'package:weather_clean_architecture_tdd/core/error/failure.dart';
import 'package:weather_clean_architecture_tdd/domain/entities/weather.dart';
import 'package:weather_clean_architecture_tdd/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {

  final WeatherRepository weatherRepository;

  GetCurrentWeatherUseCase(this.weatherRepository); 
  
  Future<Either<Failure,WeatherEntity>> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}