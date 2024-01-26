import 'package:auto_route/auto_route.dart';
import 'package:find_the_bomb_app/repository/levels_repository.dart';
import 'package:find_the_bomb_app/router/router.dart';
import 'package:find_the_bomb_app/screens/levels/bloc/level_bloc.dart';
import 'package:find_the_bomb_app/services/shared_preferences.dart';
import 'package:find_the_bomb_app/theme/colors.dart';
import 'package:find_the_bomb_app/widgets/health/bloc/health_bloc.dart';
import 'package:find_the_bomb_app/widgets/health/health_widget.dart';
import 'package:find_the_bomb_app/widgets/stroke_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class LevelsScreen extends StatefulWidget {
  const LevelsScreen({super.key});

  @override
  State<LevelsScreen> createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 25),
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HealthWidget(),
                    SizedBox(width: 35),
                    GestureDetector(
                      onTap: () {
                        context.router.popAndPush(SettingsRoute());
                      },
                      child: SvgPicture.asset(
                          'assets/images/elements/settings-button.svg'),
                    ),
                  ],
                ),
              ),
              Spacer(),
              BlocProvider(
                create: (context) => LevelBloc(GetIt.I<LevelsRepository>())
                  ..add(GetLevelsEvent()),
                child: BlocConsumer<LevelBloc, LevelState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is LoadedLevelsState) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 50),
                        height: MediaQuery.of(context).size.height * 0.5,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.levels.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () async {
                                SharedPreferencesService storage =
                                await SharedPreferencesService.getInstance();
                                if (storage.health > 0) {
                                  context.read<HealthBloc>().add(DecrementHealthEvent());
                                  context.router.popAndPush(GameRoute(level: state.levels[index]));
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
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    state.levels[index].isDone
                                        ? Image.asset(
                                            'assets/images/elements/level-done.png',
                                            width: 120,
                                          )
                                        : SvgPicture.asset(
                                      'assets/images/elements/bubble.svg',
                                            width: 120,
                                          ),
                                    StrokeTextWidget(
                                      text: 'Lvl ${state.levels[index].number}',
                                      strokeColor: AppColors.blue,
                                        fontSize: 32,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
