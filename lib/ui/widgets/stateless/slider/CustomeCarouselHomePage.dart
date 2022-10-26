import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/models/movie/movie.dart';
import 'CustomeCarouselHomePage_model.dart';

class CustomeCarouselHomePage extends StatefulWidget {
  final List<Movie> items;
  const CustomeCarouselHomePage({Key? key, required List<Movie> this.items})
      : super(key: key);

  @override
  State<CustomeCarouselHomePage> createState() =>
      _CustomeCarouselHomePageState();
}

class _CustomeCarouselHomePageState extends State<CustomeCarouselHomePage> {
  int activeIndex = 0;
  setActiveDot(index) {
    setState(() {
      activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CustomeCarouselHomePagemodel>.reactive(
        viewModelBuilder: () => CustomeCarouselHomePagemodel(),
        onModelReady: (model) async {
          await model.init(context);
        },
        builder: (context, model, child) => Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                CarouselSlider.builder(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      autoPlay: true,
                      reverse: true,
                    ),
                    itemCount: model.movies_list.length,
                    itemBuilder: (BuildContext context, int itemIndex, int x) =>
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Stack(
                            fit: StackFit.expand,
                            children: <Widget>[
                              InkWell(
                                child: Image.network(
                                  model.movies_list[itemIndex].thumb!,
                                  width: 1050,
                                  height: 350,
                                  fit: BoxFit.cover,
                                ),
                                onTap: () async {
                                  await model.moveToMovieViewRoute(
                                      context, itemIndex);
                                },
                              )
                            ],
                          ),
                        ))
              ],
            ));
  }
}

class ActiveDot extends StatelessWidget {
  const ActiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 25,
        height: 8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}

class InactiveDot extends StatelessWidget {
  const InactiveDot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
