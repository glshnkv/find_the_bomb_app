import 'package:flutter/material.dart';

import 'router/router.dart';

class FindTheBombApp extends StatelessWidget {
  FindTheBombApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Irish Grover'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );  }
}
