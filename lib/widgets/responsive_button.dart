import 'package:flutter/material.dart';
import 'package:travel_app_bestech/misc/colors.dart';
import 'package:travel_app_bestech/widgets/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;
  const ResponsiveButton({
    Key? key,
    this.width,
    this.isResponsive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor,
          ),
          width: width,
          height: 60,
          child: Row(
            mainAxisAlignment: isResponsive == true
                ? MainAxisAlignment.spaceAround
                : MainAxisAlignment.center,
            children: [
              isResponsive == true
                  ? const AppText(
                      text: 'Book trip now',
                      color: Colors.white,
                    )
                  : Container(),
              Image.asset('img/button-one.png'),
            ],
          ),
        ),
      ],
    );
  }
}
