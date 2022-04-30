import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bestech/cubit/app_cubit_states.dart';
import 'package:travel_app_bestech/cubit/app_cubits.dart';
import 'package:travel_app_bestech/misc/colors.dart';
import 'package:travel_app_bestech/widgets/app_buttons.dart';
import 'package:travel_app_bestech/widgets/app_large_text.dart';
import 'package:travel_app_bestech/widgets/responsive_button.dart';

import '../widgets/app_text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'http://mark.bslmeiyu.com/uploads/' + detail.place.img,
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 20,
                top: 60,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                      icon: const Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 320,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width,
                  height: 450,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                            text: detail.place.name,
                            color: Colors.black54,
                          ),
                          AppLargeText(
                            text: '\$ ${detail.place.price}',
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.mainColor,
                          ),
                          AppText(
                            text: detail.place.location,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(5, (index) {
                              return Icon(
                                Icons.star,
                                color: index < detail.place.stars
                                    ? AppColors.starColor
                                    : Colors.grey,
                              );
                            }),
                          ),
                          const SizedBox(width: 10),
                          const AppText(text: '(5.0)'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const AppLargeText(text: 'People', size: 20),
                      AppText(
                        text: 'Number of people in your group',
                        color: AppColors.mainTextColor,
                      ),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: AppButtons(
                              backgroundColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey.shade300,
                              text: (index + 1).toString(),
                              color: selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                              borderColor: selectedIndex == index
                                  ? Colors.black
                                  : Colors.grey.shade300,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 20),
                      const AppLargeText(text: 'Description', size: 20),
                      const SizedBox(height: 10),
                      AppText(text: detail.place.description),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      size: 60,
                      backgroundColor: Colors.white,
                      color: AppColors.textColor2,
                      borderColor: AppColors.textColor2,
                      icon: Icons.favorite_border,
                      isIcon: true,
                    ),
                    const SizedBox(width: 20),
                    const ResponsiveButton(
                      width: 250,
                      isResponsive: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
