import 'package:flutter/material.dart';
import 'package:travel_app_bestech/widgets/app_text.dart';
import '../misc/colors.dart';

class AppButtons extends StatelessWidget {
  final Color? color;
  final Color? backgroundColor;
  final double size;
  final Color borderColor;
  final String text;
  final IconData? icon;
  final bool? isIcon;

  const AppButtons(
      {Key? key,
      this.isIcon = false,
      this.color,
      this.size = 50,
      this.backgroundColor,
      this.borderColor = const Color(0xFFf1f1f9),
      this.text = 'hi',
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 5,
      ),
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text,
                color: color!,
              ),
            )
          : Icon(
              icon,
              color: color,
            ),
    );
  }
}
