import 'dart:async';
import 'dart:ffi';

import 'package:auto_route/auto_route.dart';
import 'package:find_the_bomb_app/router/router.dart';
import 'package:find_the_bomb_app/theme/colors.dart';
import 'package:find_the_bomb_app/widgets/bubble_button.dart';
import 'package:find_the_bomb_app/widgets/stroke_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

@RoutePage()
class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  bool onLoading = true;

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
        child: onLoading
            ? Container(
                color: Color.fromRGBO(0, 0, 0, 0.5),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: LinearPercentIndicator(
                        animation: true,
                        animationDuration: 3000,
                        lineHeight: 4.0,
                        percent: 1.0,
                        barRadius: Radius.circular(300),
                        backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                        progressColor: Colors.white,
                        onAnimationEnd: () {
                          setState(() {
                            onLoading = false;
                          });
                        }),
                  ),
                ),
              )
            : Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 370,
                        child: StrokeTextWidget(
                            text: 'Underwater Mission: Find the Bomb',
                            strokeColor: AppColors.black, fontSize: 40,),
                      ),
                      SizedBox(height: 15),
                      BubbleButton(
                        text: 'Next',
                        onTap: () {
                          context.router.push(OnboardingRoute());
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
