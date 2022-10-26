import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/core/repositories/movies_repository/movies_repository.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/actor/actor.dart';
import '../../../core/models/genre/genre.dart';
import '../../../core/models/movie/movie.dart';
import '../../../core/repositories/actors_repository/actors_repository.dart';
import '../../../core/services/navigation/navigation_service.dart';
import '../../../locator.dart';
import '../../router.gr.dart';

class HomeViewModel extends BaseViewModel {
  BuildContext? context;
  List<Genre> genres_list = [];

  List<Movie> movies_list = [];
  List<Actor> actors_list = [];
  Genre? selected_genre;

  Future<void> moveToMovieViewRoute(BuildContext context, index) async {
    await locator<NavigationService>()
        .pushNamed(MovieViewRoute(movie: movies_list[index]), context);
  }

  Future<void> moveToActorViewRoute(BuildContext context, index) async {
    await locator<NavigationService>()
        .pushNamed(ActorViewRoute(actor: actors_list[index]), context);
  }

  Future<void> init(BuildContext context) async {
    this.context = context;

    setBusy(true);
    movies_list = await locator<MoviesRepository>().fetchMoviesList(
      {'paginate': '1000000', 'lang': 'en'},
    );
    actors_list = await locator<ActorsRepository>()
        .fetchActorsList({'paginate': '1000000', 'lang': 'en'});
    genres_list =
        await locator<MoviesRepository>().fetchGenresList({'lang': 'en'});

    setBusy(false);
  }
}
