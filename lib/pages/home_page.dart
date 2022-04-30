import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bestech/cubit/app_cubit_states.dart';
import 'package:travel_app_bestech/cubit/app_cubits.dart';
import 'package:travel_app_bestech/widgets/app_large_text.dart';
import 'package:travel_app_bestech/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Map<String, String> images = {
    'balloning.png': 'Balloning',
    'hiking.png': 'Hiking',
    'kayaking.png': 'Kayaking',
    'snorkling.png': 'Snorkling',
  };
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.places;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 70, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: AppLargeText(text: 'Discover'),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                controller: _tabController,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: 'Places'),
                  Tab(text: 'Inspiration'),
                  Tab(text: 'Emotions'),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 300,
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.builder(
                    itemCount: info.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).detailPage(
                            info[index],
                          );
                        },
                        child: Container(
                          margin: EdgeInsets.all(10),
                          width: 200,
                          height: 300,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            //color: Colors.white,
                            image: DecorationImage(
                              image: NetworkImage(
                                'http://mark.bslmeiyu.com/uploads/' +
                                    info[index].img,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  Text('There'),
                  Text('Bye'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  AppLargeText(
                    text: 'Explore more',
                    size: 22,
                  ),
                  AppText(text: 'See all'),
                ],
              ),
            ),
            SizedBox(
              height: 100,
              width: double.maxFinite,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.red,
                            image: DecorationImage(
                                image: AssetImage(
                                  'img/' + images.keys.elementAt(index),
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: AppText(
                            text: images.values.elementAt(index),
                          ),
                        )
                      ],
                    );
                  }),
            )
          ],
        );
      } else {
        return Container();
      }
    }));
  }
}
