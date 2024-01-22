import 'package:find_the_bomb_app/theme/colors.dart';
import 'package:find_the_bomb_app/widgets/stroke_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BubbleButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const BubbleButton({super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/elements/bubble.svg',
            width: 120,
          ),
          StrokeTextWidget(
            fontSize: 32,
            text: text,
            strokeColor: AppColors.blue,
          ),
        ],
      ),
    );
  }
}
