// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    EndGameRoute.name: (routeData) {
      final args = routeData.argsAs<EndGameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EndGameScreen(
          key: args.key,
          level: args.level,
          health: args.health,
        ),
      );
    },
    GameRoute.name: (routeData) {
      final args = routeData.argsAs<GameRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: GameScreen(
          key: args.key,
          level: args.level,
        ),
      );
    },
    LevelsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LevelsScreen(),
      );
    },
    LoadingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoadingScreen(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OnboardingScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsScreen(),
      );
    },
  };
}

/// generated route for
/// [EndGameScreen]
class EndGameRoute extends PageRouteInfo<EndGameRouteArgs> {
  EndGameRoute({
    Key? key,
    required LevelModel level,
    required int health,
    List<PageRouteInfo>? children,
  }) : super(
          EndGameRoute.name,
          args: EndGameRouteArgs(
            key: key,
            level: level,
            health: health,
          ),
          initialChildren: children,
        );

  static const String name = 'EndGameRoute';

  static const PageInfo<EndGameRouteArgs> page =
      PageInfo<EndGameRouteArgs>(name);
}

class EndGameRouteArgs {
  const EndGameRouteArgs({
    this.key,
    required this.level,
    required this.health,
  });

  final Key? key;

  final LevelModel level;

  final int health;

  @override
  String toString() {
    return 'EndGameRouteArgs{key: $key, level: $level, health: $health}';
  }
}

/// generated route for
/// [GameScreen]
class GameRoute extends PageRouteInfo<GameRouteArgs> {
  GameRoute({
    Key? key,
    required LevelModel level,
    List<PageRouteInfo>? children,
  }) : super(
          GameRoute.name,
          args: GameRouteArgs(
            key: key,
            level: level,
          ),
          initialChildren: children,
        );

  static const String name = 'GameRoute';

  static const PageInfo<GameRouteArgs> page = PageInfo<GameRouteArgs>(name);
}

class GameRouteArgs {
  const GameRouteArgs({
    this.key,
    required this.level,
  });

  final Key? key;

  final LevelModel level;

  @override
  String toString() {
    return 'GameRouteArgs{key: $key, level: $level}';
  }
}

/// generated route for
/// [LevelsScreen]
class LevelsRoute extends PageRouteInfo<void> {
  const LevelsRoute({List<PageRouteInfo>? children})
      : super(
          LevelsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LevelsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OnboardingScreen]
class OnboardingRoute extends PageRouteInfo<void> {
  const OnboardingRoute({List<PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
