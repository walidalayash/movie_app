import 'dart:async';

import 'package:flutter/material.dart';

import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp/core/models/movie/movie.dart';
import 'package:movieapp/generated/l10n.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/end_point_parameters.dart';
import '../../../core/repositories/movies_repository/movies_repository.dart';
import '../../../locator.dart';
import '../../widgets/stateless/indicators/empty_list_indicator.dart';
import '../../widgets/stateless/indicators/error_indicator.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import '../../widgets/stateless/movie_tile/movie_tile.dart';
import 'movies_list_view_model.dart';

// ignore: must_be_immutable
class PagedMoviesListView extends StatefulWidget {
  int rating;
  String year;
  final ValueChanged<Movie> onMoviesClicked;
  Map<String, dynamic> parameters;

  PagedMoviesListView(this.rating, this.year, this.parameters,
      {required this.onMoviesClicked});

  @override
  _PagedMoviesItemsListViewViewState createState() =>
      _PagedMoviesItemsListViewViewState();
}

class _PagedMoviesItemsListViewViewState extends State<PagedMoviesListView> {
  _PagedMoviesItemsListViewViewState();

  final ScrollController? controller = ScrollController();

  final _pagingController = PagingController<int, Movie>(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });

    super.initState();
  }

  @override
  void didUpdateWidget(PagedMoviesListView oldWidget) {
    _pagingController.refresh();
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var parameters = widget.parameters;

      parameters.putIfAbsent(EndPointParameter.PAGE, () => pageKey.toString());
      parameters[EndPointParameter.PAGE] = pageKey.toString();

      var items = await locator<MoviesRepository>().fetchMoviesList(parameters);

      if (items.isEmpty) {
        _pagingController.appendLastPage(items);
      } else {
        final nextPageKey = pageKey + 1;
        _pagingController.appendPage(items, nextPageKey);
      }
    } catch (error) {
      print(error);
      _pagingController.error = error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MoviesListViewModel>.reactive(
      viewModelBuilder: () => MoviesListViewModel(),
      onModelReady: (model) async {
        await model.init(context);
      },
      builder: (context, model, child) => PagedListView.separated(
        physics: BouncingScrollPhysics(),
        scrollController: controller,
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<Movie>(
          itemBuilder: (context, movie, index) => widget.year == '' &&
                  widget.rating == 0
              ? MovieTile(
                  movie: movie,
                  onChanged: (movie) {},
                )
              : widget.year ==
                          DateTime.parse(movie.release_date!).year.toString() &&
                      widget.rating == 0
                  ? MovieTile(
                      movie: movie,
                      onChanged: (movie) {},
                    )
                  : widget.year ==
                              DateTime.parse(movie.release_date!)
                                  .year
                                  .toString() &&
                          widget.rating == movie.rental_rate!
                      ? MovieTile(
                          movie: movie,
                          onChanged: (movie) {},
                        )
                      : Container(),
          firstPageProgressIndicatorBuilder: (context) =>
              LoadingCircularProgressIndicator(),
          newPageProgressIndicatorBuilder: (context) =>
              LoadingCircularProgressIndicator(),
          firstPageErrorIndicatorBuilder: (context) => ErrorIndicator(
            error: _pagingController.error,
            onTryAgain: () => _pagingController.refresh(),
          ),
          noItemsFoundIndicatorBuilder: (context) => EmptyListIndicator(
            title: '${AppLocalizations.of(context).empty_list}', //
            message: '${AppLocalizations.of(context).empty_list}', //
          ),
        ),
        padding: const EdgeInsets.all(4),
        separatorBuilder: (context, index) => const SizedBox(
          height: 0,
        ),
      ),
    );
  }
}
