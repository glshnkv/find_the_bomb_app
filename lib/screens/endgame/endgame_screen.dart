import 'package:auto_route/auto_route.dart';
import 'package:find_the_bomb_app/models/level_model.dart';
import 'package:find_the_bomb_app/router/router.dart';
import 'package:find_the_bomb_app/theme/colors.dart';
import 'package:find_the_bomb_app/widgets/bubble_button.dart';
import 'package:find_the_bomb_app/widgets/health/bloc/health_bloc.dart';
import 'package:find_the_bomb_app/widgets/stroke_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class EndGameScreen extends StatefulWidget {
  final LevelModel level;
  final int health;

  const EndGameScreen({super.key, required this.level, required this.health});

  @override
  State<EndGameScreen> createState() => _EndGameScreenState();
}

class _EndGameScreenState extends State<EndGameScreen> {
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
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/elements/banner.png'),
                    Container(
                      height: 240,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          StrokeTextWidget(
                              text: 'Lvl ${widget.level.number}',
                              strokeColor: AppColors.blue,
                              fontSize: 32),
                          Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                      'assets/images/elements/health-opacity.svg'),
                                  SvgPicture.asset(
                                      'assets/images/elements/health-opacity.svg'),
                                  SvgPicture.asset(
                                      'assets/images/elements/health-opacity.svg'),
                                ],
                              ),
                              Center(
                                child: Container(
                                  height: 60,
                                  width: 126,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: widget.health,
                                    itemBuilder: (context, index) {
                                      return SvgPicture.asset(
                                          'assets/images/elements/health.svg');
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: widget.health == 0
                  ? Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset('assets/images/fishes/red.png'),
                    )
                  : Align(
                      alignment: Alignment.bottomLeft,
                      child: Image.asset('assets/images/fishes/yellow.png'),
                    ),
            ),
            BlocProvider(
              create: (context) =>
              HealthBloc()..add(GetHealthEvent()),
              child: BlocConsumer<HealthBloc, HealthState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is UpdateHealthState) {
                    return SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      context.router.push(LevelsRoute());
                                    },
                                    child: SvgPicture.asset(
                                        'assets/images/elements/home-button.svg'),
                                  ),
                                  SizedBox(height: 15),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/elements/health.svg'),
                                      StrokeTextWidget(
                                          text: '${state.health}x',
                                          strokeColor: AppColors.blue,
                                          fontSize: 32),
                                    ],
                                  ),
                                ],
                              ),
                              widget.level.isDone
                                  ? BubbleButton(
                                  text: 'Next',
                                  onTap: () {
                                    context.router.push(LevelsRoute());
                                  })
                                  : BubbleButton(
                                  text: 'Retry',
                                  onTap: () {
                                    if (state.health != 0) {
                                      context.read<HealthBloc>().add(DecrementHealthEvent());
                                      context.router.push(GameRoute(level: widget.level));
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: AppColors.blue,
                                          content: Text(
                                            'Oops... Not enough Health. Try Later.',
                                            style: TextStyle(color: AppColors.white),
                                          ),
                                        ),
                                      );
                                    }
                                  }),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
