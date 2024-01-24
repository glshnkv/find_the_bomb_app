import 'package:auto_route/auto_route.dart';
import 'package:find_the_bomb_app/router/router.dart';
import 'package:find_the_bomb_app/theme/colors.dart';
import 'package:find_the_bomb_app/widgets/bubble_button.dart';
import 'package:find_the_bomb_app/widgets/stroke_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
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
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Color.fromRGBO(0, 0, 0, 0.5),
          child: Center(
            child: SizedBox(
              width: 770,
              height: 350,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Image.asset('assets/images/fishes/purple.png'),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 520,
                      height: 220,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/images/onboarding/speech-bubble.png',
                            width: 520,
                          ),
                          Align(
                            alignment: Alignment(0, -0.25),
                            child: SizedBox(
                              width: 460,
                              child: StrokeTextWidget(
                                fontSize: 20,
                                text:
                                    'Immerse yourself in an exciting underwater adventure, try yourself as a marine explorer and prove your wits, resourcefulness and attention in searching for a bomb in the underwater world.',
                                strokeColor: AppColors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: BubbleButton(
                      text: 'Start',
                      onTap: () {
                        context.router.push(LevelsRoute());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
