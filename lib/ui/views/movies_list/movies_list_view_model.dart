import 'dart:async';

import 'package:flutter/material.dart';
import 'package:movieapp/core/repositories/movies_repository/movies_repository.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/genre/genre.dart';
import '../../../core/models/movie/movie.dart';
import '../../../locator.dart';

class MoviesListViewModel extends BaseViewModel {
  BuildContext? context;

  List<Movie> movies_list = [];
  List<Genre> genres_list = [];
  String? q = '';
  Genre? selected_genre;
  String? y = '';
  int? r = 0;
  Future<void> init(BuildContext context) async {
    this.context = context;

    setBusy(true);

    movies_list = await locator<MoviesRepository>()
        .fetchMoviesList({'paginate': '1000000'});
    genres_list =
        await locator<MoviesRepository>().fetchGenresList({'lang': 'en'});
    if (genres_list.isNotEmpty) {
      selected_genre = genres_list.first;
    }

    setBusy(false);
  }
}
