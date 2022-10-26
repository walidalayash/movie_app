import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/actor/actor.dart';
import '../../../core/models/movie/movie.dart';
import '../../../core/repositories/movies_repository/movies_repository.dart';
import '../../../core/services/navigation/navigation_service.dart';
import '../../../locator.dart';
import '../../router.gr.dart';

class ActorViewModel extends BaseViewModel {
  BuildContext? context;
  Actor? actor;
  List<Movie> movies_list = [];
  Future<void> moveToMovieViewRoute(BuildContext context, index) async {
    await locator<NavigationService>()
        .pushNamed(MovieViewRoute(movie: movies_list[index]), context);
  }

  Future<void> init(BuildContext context) async {
    this.context = context;

    setBusy(true);
    movies_list = await locator<MoviesRepository>()
        .fetchMoviesList({'paginate': '1000000'});

    setBusy(false);
  }
}
