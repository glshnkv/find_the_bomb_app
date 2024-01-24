import 'package:auto_route/auto_route.dart';
import 'package:find_the_bomb_app/router/router.dart';
import 'package:find_the_bomb_app/theme/colors.dart';
import 'package:find_the_bomb_app/widgets/health/bloc/health_bloc.dart';
import 'package:find_the_bomb_app/widgets/stroke_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/elements/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/elements/banner.png'),
                      Column(
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: StrokeTextWidget(
                                  text: 'Privacy Policy',
                                  strokeColor: AppColors.blue,
                                  fontSize: 32)),
                          TextButton(
                              onPressed: () {},
                              child: StrokeTextWidget(
                                  text: 'Terms of Use',
                                  strokeColor: AppColors.blue,
                                  fontSize: 32)),
                          TextButton(
                              onPressed: () {},
                              child: StrokeTextWidget(
                                  text: 'Rate App',
                                  strokeColor: AppColors.blue,
                                  fontSize: 32)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset('assets/images/fishes/purple.png'),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.router.push(LevelsRoute());
                        },
                        child: SvgPicture.asset(
                            'assets/images/elements/home-button.svg'),
                      ),
                      SizedBox(height: 15),
                      BlocProvider(
                        create: (context) => HealthBloc()..add(GetHealthEvent()),
                        child: BlocConsumer<HealthBloc, HealthState>(
                          listener: (context, state) {
                          },
                          builder: (context, state) {
                            if (state is UpdateHealthState) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/elements/health.svg'),
                                  StrokeTextWidget(
                                      text: '${state.health}x',
                                      strokeColor: AppColors.blue,
                                      fontSize: 32),
                                ],
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
