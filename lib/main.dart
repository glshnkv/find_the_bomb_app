import 'package:find_the_bomb_app/find_the_bomb_app.dart';
import 'package:find_the_bomb_app/repository/levels_repository.dart';
import 'package:find_the_bomb_app/screens/levels/bloc/level_bloc.dart';
import 'package:find_the_bomb_app/widgets/health/bloc/health_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await GetIt.instance.registerSingleton(LevelsRepository());

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<LevelBloc>(
          create: (context) => LevelBloc(GetIt.I<LevelsRepository>())),
      BlocProvider<HealthBloc>(create: (context) => HealthBloc()),
    ],
    child: FindTheBombApp(),
  ));
}
