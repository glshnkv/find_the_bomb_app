part of 'health_bloc.dart';

@immutable
abstract class HealthState {}

class HealthInitial extends HealthState {}

class LoadingHealthState extends HealthState {}

class UpdateHealthState extends HealthState {
  final int health;

  UpdateHealthState({required this.health});
}

class EnoughHealthState extends HealthState {}

class NotEnoughHealthState extends HealthState {}