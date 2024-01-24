import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:find_the_bomb_app/services/shared_preferences.dart';
import 'package:meta/meta.dart';

part 'health_event.dart';
part 'health_state.dart';

class HealthBloc extends Bloc<HealthEvent, HealthState> {
  HealthBloc() : super(HealthInitial()) {
    on<GetHealthEvent>(_getHealthHandler);
    on<DecrementHealthEvent>(_decrementHealthHandler);

  }
  void _getHealthHandler(
      GetHealthEvent event, Emitter<HealthState> emit) async {
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    emit(LoadingHealthState());
    emit(UpdateHealthState(health: storage.health));
  }


  void _decrementHealthHandler(
      DecrementHealthEvent event, Emitter<HealthState> emit) async {
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    storage.health -= 1;
    emit(UpdateHealthState(health: storage.health));
  }

  // void _implementHealthHandler(
  //     ImplementHealthEvent event, Emitter<HealthState> emit) async {
  //   SharedPreferencesService storage = await SharedPreferencesService.getInstance();
  //   storage.Health += 5;
  //   emit(UpdateHealthState(health: storage.health));
  // }
}
