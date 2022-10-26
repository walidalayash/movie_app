import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/getwidget.dart';

import 'package:movieapp/ui/shared/ui_helper.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/movie/movie.dart';
import '../../../core/models/provider_data/provider_data.dart';
import '../../../generated/l10n.dart';
import '../../widgets/stateless/app_bar.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'movie_view_model.dart';

// ignore: must_be_immutable
class MovieView extends StatefulWidget {
  Movie movie;

  MovieView(this.movie);

  @override
  _MovieViewState createState() => _MovieViewState();
}

class _MovieViewState extends State<MovieView>
    with SingleTickerProviderStateMixin {
  @override
  void didUpdateWidget(MovieView oldWidget) {
    // if (oldWidget.listPreferences != widget.listPreferences) {
    //   _pagingController.refresh();
    // }
    super.didUpdateWidget(oldWidget);
  }

  TextEditingController? commentController;
  FocusNode? commentFocusNode;

  @override
  void initState() {
    super.initState();
    commentController = TextEditingController();

    commentFocusNode = FocusNode();
  }

  @override
  void dispose() {
    commentController!.dispose();

    super.dispose();
  }

  var rng = Random();
  final my_commentController = TextEditingController();
  Future<void> _LoginBefore() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '${AppLocalizations.of(context).warning}',
            style: TextStyle(),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Login before',
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                '${AppLocalizations.of(context).ok}',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void addC(user, double ratingNow) {
    Provider.of<ProviderData>(context, listen: false).comments.add(Comment(
        name: user, rating: ratingNow, comment: my_commentController.text));
    _comment_added();
  }

  Future<void> _comment_added() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '${AppLocalizations.of(context).warning}',
            style: TextStyle(),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Comment added',
                  style: TextStyle(),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(
                '${AppLocalizations.of(context).ok}',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _ShowComments(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: Provider.of<ProviderData>(context, listen: false)
                  .comments
                  .length,
              itemBuilder: (context, index) => Column(children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            border: Border.all(width: 3.0), // Set border width
                            borderRadius: BorderRadius.all(Radius.circular(
                                20.0)), // Set rounded corner radius
                          ),
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 30,
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  UIHelper.verticalSpaceSmall(),
                                  Text(Provider.of<ProviderData>(context,
                                          listen: false)
                                      .comments[index]
                                      .name),
                                ],
                              ),
                              UIHelper.horizontalSpaceMedium(),
                              Column(children: [
                                GFRating(
                                  value: Provider.of<ProviderData>(context,
                                          listen: false)
                                      .comments[index]
                                      .rating,
                                  color: Colors.amber,
                                  onChanged: (value) {},
                                ),
                                Text(Provider.of<ProviderData>(context,
                                        listen: false)
                                    .comments[index]
                                    .comment),
                              ])
                            ],
                          ),
                        ),
                      ],
                    )
                  ])),
        );
      },
    );
  }

  int x = 0;
  bool like = false;
  @override
  Widget build(BuildContext context) {
    double ratingNow = 0;
    return ViewModelBuilder<MovieViewModel>.reactive(
      viewModelBuilder: () => MovieViewModel(),
      onModelReady: (model) async {
        await model.init(context, widget.movie.id);
      },
      builder: (context, model, child) => model.isBusy
          ? Scaffold(
              //  drawer: Drawer(child: CustomerDrawerMenu()),
              appBar: MyAppBar('${AppLocalizations.of(context).movies}'),
              body: LoadingCircularProgressIndicator())
          : Scaffold(
              appBar: MyAppBar(widget.movie.title),
              body: model.isBusy
                  ? LoadingCircularProgressIndicator()
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20.0,
                                ),
                              ],
                            ),
                            child: ClipPath(
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: widget.movie.img ??
                                      'https://freepikpsd.com/file/2019/10/placeholder-image-png-5-Transparent-Images.png',
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) =>
                                      CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Container(
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
                          ),

                          //Moive detils

                          UIHelper.verticalSpaceMedium(),

                          Text(
                              '${AppLocalizations.of(context).overview}'
                                  .toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Divider(color: Colors.black),

                          UIHelper.verticalSpaceMedium(),
                          //
                          Container(
                            height: 35,
                            child: Text(widget.movie.description!,
                                style: TextStyle()),
                          ),
                          UIHelper.verticalSpaceLarge(),
                          Divider(color: Colors.black),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      '${AppLocalizations.of(context).release_date}'
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                    widget.movie.release_date!,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      '${AppLocalizations.of(context).run_time}'
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                    'Hr:${widget.movie.running_time!.hours.toString()} min:${widget.movie.running_time!.minutes.toString()}',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                      '${AppLocalizations.of(context).box_office}'
                                          .toUpperCase(),
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                    widget.movie.box_office!,
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          UIHelper.verticalSpaceMedium(),
                          Divider(color: Colors.black),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GFRating(
                                color: Colors.amber,
                                size: 20.0,
                                value: widget.movie.rental_rate!.toDouble(),
                                onChanged: (value) {},
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (like == false) {
                                      like = true;
                                    } else {
                                      like = false;
                                    }
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  child: like == false
                                      ? Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/shop-5d193.appspot.com/o/heart-thin-icon.png?alt=media&token=f01d37a8-babf-4c78-871e-4cdcf63de355')
                                      : Image.network(
                                          'https://firebasestorage.googleapis.com/v0/b/shop-5d193.appspot.com/o/red_heart_icon.png?alt=media&token=325dc5a7-ba04-4ff1-8bcd-c6f7c2c41200'),
                                ),
                              )
                            ],
                          ),
                          UIHelper.verticalSpaceExtraLarge(),
                          //
                          Text(
                              '${AppLocalizations.of(context).cast}'
                                  .toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          UIHelper.verticalSpaceMedium(),
                          Container(
                              height: 150,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: model.cast!.length,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      elevation: 3,
                                      child: ClipRRect(
                                        child: CachedNetworkImage(
                                          imageUrl: model.cast![index].thumb!,
                                          imageBuilder:
                                              (context, imageBuilder) {
                                            return InkWell(
                                              child: Container(
                                                width: 80,
                                                height: 80,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(100)),
                                                  image: DecorationImage(
                                                    image: imageBuilder,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              onTap: () async {
                                                await model
                                                    .moveToActorViewRoute(
                                                        context, index);
                                              },
                                            );
                                          },
                                          placeholder: (context, url) =>
                                              Container(
                                            width: 80,
                                            height: 80,
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator()),
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
                                          model.cast![index].name.toString(),
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
                          //recommened moive
                          Text(
                              '${AppLocalizations.of(context).recommended_movie}'
                                  .toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          UIHelper.verticalSpaceMedium(),
                          Container(
                            height: 300,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: model.related_movies!.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  InkWell(
                                    child: Image.network(model
                                        .related_movies![0].thumb
                                        .toString()),
                                    onTap: () async {
                                      await model.moveToMovieViewRoute(
                                          context, x);
                                    },
                                  ),
                                  Text(model.related_movies![0].title
                                      .toString()),
                                ],
                              ),
                            ),
                          ),

                          //rating
                          Text(
                              '${AppLocalizations.of(context).write_your_comment_here}'
                                  .toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Container(
                            width: 350,
                            height: 70,
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              textInputAction: TextInputAction.next,
                              cursorColor: Colors.black,
                              controller: my_commentController,
                              //textAlign: TextAlign.center,

                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(),
                                ),
                                hintText:
                                    '${AppLocalizations.of(context).comment}...',
                              ),
                            ),
                          ),
                          Text(
                              '${AppLocalizations.of(context).add_your_rating}'
                                  .toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          RatingBar.builder(
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              ratingNow = rating;
                            },
                          ),
                          UIHelper.verticalSpaceLarge(),
                          //
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  model.token == null
                                      ? _LoginBefore()
                                      : addC(
                                          model.User_list!.email!, ratingNow);
                                },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ))),
                                child: Text(
                                  '${AppLocalizations.of(context).add_comment}',
                                ),
                              ),
                              UIHelper.horizontalSpaceLarge(),
                              ElevatedButton(
                                onPressed: () {
                                  _ShowComments(context);
                                },
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50.0),
                                ))),
                                child: Text(
                                  '${AppLocalizations.of(context).show_other_comments}',
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
    );
  }
}
