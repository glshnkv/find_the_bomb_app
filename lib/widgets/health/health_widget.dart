import 'dart:async';

import 'package:find_the_bomb_app/services/shared_preferences.dart';
import 'package:find_the_bomb_app/widgets/health/bloc/health_bloc.dart';
import 'package:find_the_bomb_app/widgets/health/bloc/health_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HealthWidget extends StatefulWidget {
  const HealthWidget({super.key});

  @override
  State<HealthWidget> createState() => _HealthWidgetState();
}

class _HealthWidgetState extends State<HealthWidget> {
  Timer? _timer;

  @override
  void initState() {
    _startTimer();
    super.initState();
  }

  void _startTimer() async {
    SharedPreferencesService storage =
        await SharedPreferencesService.getInstance();
    _timer = Timer.periodic(const Duration(minutes: 3), (timer) {
      if (storage.health == 0) {
        storage.health += 3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SvgPicture.asset('assets/images/elements/health-opacity.svg'),
            SvgPicture.asset('assets/images/elements/health-opacity.svg'),
            SvgPicture.asset('assets/images/elements/health-opacity.svg'),
          ],
        ),
        BlocProvider(
          create: (context) => HealthBloc()..add(GetHealthEvent()),
          child: BlocConsumer<HealthBloc, HealthState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              if (state is UpdateHealthState) {
                return Container(
                  height: 60,
                  width: 126,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: state.health,
                    itemBuilder: (context, index) {
                      return SvgPicture.asset('assets/images/elements/health.svg');
                    },
                  ),
                );
              } else if (state is LoadingHealthState) {
                return const CircularProgressIndicator();
              }
              return Container();
            },
          ),
        ),
      ],
    );
  }
}
