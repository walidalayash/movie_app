import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movieapp/core/models/movie/movie.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/actor/actor.dart';
import '../../../core/models/cast/cast.dart';
import '../../../core/models/related_movies/related_movies.dart';
import '../../../core/models/user/user.dart';
import '../../../core/repositories/actors_repository/actors_repository.dart';
import '../../../core/repositories/cast_repository/cast_repository.dart';
import '../../../core/repositories/movies_repository/movies_repository.dart';
import '../../../core/repositories/related_movies_repository/related_movies_repository.dart';
import '../../../core/repositories/users_repository/users_repository.dart';
import '../../../core/services/navigation/navigation_service.dart';
import '../../../locator.dart';
import '../../router.gr.dart';

class MovieViewModel extends BaseViewModel {
  BuildContext? context;
  List<Movie> movies_list = [];
  Movie? movie;
  List<Actor> actors_list = [];
  List<RelatedMovies>? related_movies = [];
  List<Cast>? cast = [];
  String? token;
  User? User_list;
  Future<void> moveToActorViewRoute(BuildContext context, index) async {
    await locator<NavigationService>()
        .pushNamed(ActorViewRoute(actor: actors_list[index]), context);
  }

  Future<void> moveToMovieViewRoute(BuildContext context, index) async {
    await locator<NavigationService>()
        .pushNamed(MovieViewRoute(movie: movies_list[index]), context);
  }

  Future<void> init(BuildContext context, id) async {
    this.context = context;

    setBusy(true);
    movies_list = await locator<MoviesRepository>()
        .fetchMoviesList({'paginate': '1000000'});
    // movies_list[0].id;
    related_movies =
        await locator<RelatedMoviesRepository>().fetchRelatedMoviesList(id);
    cast = await locator<CastRepository>().fetchCastList(id);

    actors_list = await locator<ActorsRepository>()
        .fetchActorsList({'paginate': '1000000'});
    token = await FlutterSecureStorage().read(key: 'token');
    User_list = await locator<UsersRepository>().fetchUser();

    setBusy(false);
  }
}
