import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/components/rating/gf_rating.dart';
import 'package:movieapp/core/models/movie/movie.dart';
import 'package:stacked/stacked.dart';

import '../../../generated/l10n.dart';
import '../../shared/ui_helper.dart';
import '../../widgets/stateless/app_bar.dart';
import '../../widgets/stateless/drawer/customer_drawer_menu.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import '../../widgets/stateless/slider/CustomeCarouselHomePage.dart';
import 'home_view_model.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Movie? movie;

  String? selectedGenre;
  int length_selectedGenre = 0;
  void length(List<Movie> m, selectedGenre) {
    length_selectedGenre = 0;
    for (var i = 0; i < 210; i++) {
      for (var i = 0; i < m[i].genres!.length; i++) {
        if (selectedGenre == m[i].genres![0].name) {
          length_selectedGenre = length_selectedGenre + 1;
        }
      }
    }
  }

  RatingBar ratingBar = RatingBar.builder(
    itemBuilder: (context, _) => const Icon(
      Icons.star,
      color: Colors.amber,
    ),
    onRatingUpdate: (rating) {},
  );

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }

  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return ViewModelBuilder<HomeViewModel>.reactive(
          viewModelBuilder: () => HomeViewModel(),
          onModelReady: (model) async {
            await model.init(context);
          },
          builder: (context, model, child) => model.isBusy
              ? LoadingCircularProgressIndicator()
              : Scaffold(
                  drawer: Drawer(child: CustomerDrawerMenu()),
                  appBar: MyAppBar('${AppLocalizations.of(context).home_view}'),
                  body: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(children: [
                      UIHelper.verticalSpaceMedium(),
                      //slider
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 30.0),
                          height: 250.0,
                          child: CustomeCarouselHomePage(
                            items: model.movies_list,
                          )),

                      //genres
                      Container(
                        height: 40,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: model.genres_list.length,
                            itemBuilder: (context, index) => Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.black45,
                                        ),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25),
                                        ),
                                        color: (model.genres_list[index].name ==
                                                selectedGenre)
                                            ? Colors.black45
                                            : Colors.white,
                                      ),
                                      child: InkWell(
                                        child: Text(
                                          model.genres_list[index].name!,
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selectedGenre =
                                                model.genres_list[index].name;
                                            length(model.movies_list,
                                                selectedGenre);
                                          });
                                        },
                                      ),
                                    ),
                                    UIHelper.horizontalSpaceMedium(),
                                  ],
                                )),
                      ),
                      UIHelper.verticalSpaceMedium(),
                      Container(
                        child: Text(
                          '${AppLocalizations.of(context).new_rental}'
                              .toUpperCase(),
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      UIHelper.verticalSpaceMedium(),

                      //movie
                      selectedGenre == null
                          ? Container(
                              height: 300,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: model.movies_list.length,
                                  itemBuilder: (context, index) => Column(
                                        children: [
                                          InkWell(
                                            child: Image.network(model
                                                .movies_list[index].thumb!),
                                            onTap: () async {
                                              await model.moveToMovieViewRoute(
                                                  context, index);
                                            },
                                          ),
                                          Text(model.movies_list[index].title!),
                                          GFRating(
                                            color: Colors.amber,
                                            size: 20.0,
                                            value: model
                                                .movies_list[index].rental_rate!
                                                .toDouble(),
                                            onChanged: (value) {},
                                          ),
                                        ],
                                      )),
                            )
                          : Container(
                              height: 300,
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: length_selectedGenre,
                                  itemBuilder: (context, index) =>
                                      selectedGenre ==
                                              model.movies_list[index]
                                                  .genres![0].name
                                          ? Column(
                                              children: [
                                                InkWell(
                                                  child: Image.network(model
                                                      .movies_list[index]
                                                      .thumb!),
                                                  onTap: () async {
                                                    await model
                                                        .moveToMovieViewRoute(
                                                            context, index);
                                                  },
                                                ),
                                                Text(model
                                                    .movies_list[index].title!),
                                                GFRating(
                                                  color: Colors.amber,
                                                  size: 20.0,
                                                  value: model
                                                      .movies_list[index]
                                                      .rental_rate!
                                                      .toDouble(),
                                                  onChanged: (value) {},
                                                ),
                                              ],
                                            )
                                          : Container()),
                            ),

                      /////////////////////////////////////actor
                      Text(
                        '${AppLocalizations.of(context).trending_actors_on_this_week}'
                            .toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      UIHelper.verticalSpaceMedium(),
                      Container(
                          height: 150,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: model.actors_list.length,
                            itemBuilder: (context, index) => Column(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  elevation: 3,
                                  child: ClipRRect(
                                    child: CachedNetworkImage(
                                      imageUrl: model.actors_list[index].thumb!,
                                      imageBuilder: (context, imageBuilder) {
                                        return InkWell(
                                          child: Container(
                                            width: 80,
                                            height: 80,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(100)),
                                              image: DecorationImage(
                                                image: imageBuilder,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          onTap: () async {
                                            await model.moveToActorViewRoute(
                                                context, index);
                                          },
                                        );
                                      },
                                      placeholder: (context, url) => Container(
                                        width: 80,
                                        height: 80,
                                        child: Center(
                                            child: CircularProgressIndicator()),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/img_not_found.jpg'),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Center(
                                    child: Text(
                                      model.actors_list[index].name!,
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ]),
                  ),
                ));
    });
  }
}
