import 'package:flutter/cupertino.dart';
import 'package:movieapp/core/models/movie/movie.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/services/navigation/navigation_service.dart';
import '../../../../locator.dart';
import '../../../router.gr.dart';

class MovieTileViewModel extends BaseViewModel {
  Movie? movie;

  void init(Movie movie) {
    this.movie = movie;
  }

  Future<void> moveToMovieViewRoute(BuildContext context) async {
    await locator<NavigationService>()
        .pushNamed(MovieViewRoute(movie: movie!), context);
  }
}
