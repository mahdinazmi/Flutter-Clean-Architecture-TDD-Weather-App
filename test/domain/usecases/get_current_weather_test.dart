

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_clean_architecture_tdd/domain/entities/weather.dart';
import 'package:weather_clean_architecture_tdd/domain/usecases/get_current_weather.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  
  late GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;

  setUp((){
    mockWeatherRepository = MockWeatherRepository();
    getCurrentWeatherUseCase = GetCurrentWeatherUseCase(mockWeatherRepository);
  });

  const testWeatherDetail = WeatherEntity(
    cityName: 'New York',
    main: 'Clouds',
    description: 'few clouds',
    iconCode: '02d',
    temperature: 302.28,
    pressure: 1009,
    humidity: 70,
  );
  
  const testCityName = 'New York';

  test(
    'should get current weather detail from the repository',
    () async {
      // arrange
       when(
        mockWeatherRepository.getCurrentWeather(testCityName)
       ).thenAnswer((_) async => const Right(testWeatherDetail) );
       
      // act
      final result = await getCurrentWeatherUseCase.execute(testCityName);

      // assert
      expect(result, const Right(testWeatherDetail));

    }
  );
}