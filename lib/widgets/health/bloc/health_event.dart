part of 'health_bloc.dart';

@immutable
abstract class HealthEvent {}

class GetHealthEvent extends HealthEvent {}

class DecrementHealthEvent extends HealthEvent {}