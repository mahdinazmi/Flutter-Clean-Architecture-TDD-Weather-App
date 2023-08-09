import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_clean_architecture_tdd/domain/usecases/get_current_weather.dart';
import 'package:weather_clean_architecture_tdd/presentation/bloc/weather_event.dart';
import 'package:weather_clean_architecture_tdd/presentation/bloc/weather_state.dart';
import 'package:rxdart/rxdart.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState> {
  
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;
  WeatherBloc(this._getCurrentWeatherUseCase) : super(WeatherEmpty()) {
    on<OnCityChanged>(
      (event, emit) async {

        emit(WeatherLoading());
        final result = await _getCurrentWeatherUseCase.execute(event.cityName);
        result.fold(
          (failure) {
            emit(WeatherLoadFailue(failure.message));
          },
          (data) {
            emit(WeatherLoaded(data));
          },
        );
      },
      transformer: debounce(const Duration(milliseconds: 500)),
    );
  }
}

EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }