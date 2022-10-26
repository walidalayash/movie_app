import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:movieapp/generated/l10n.dart';
import 'package:movieapp/ui/widgets/stateless/actor_tile/actor_tile.dart';
import 'package:stacked/stacked.dart';

import '../../../core/constant/end_point_parameters.dart';
import '../../../core/models/actor/actor.dart';
import '../../../core/repositories/actors_repository/actors_repository.dart';
import '../../../locator.dart';
import '../../widgets/stateless/indicators/empty_list_indicator.dart';
import '../../widgets/stateless/indicators/error_indicator.dart';
import '../../widgets/stateless/indicators/loading_circular_progress_indicator.dart';
import 'actors_list_view_model.dart';

// ignore: must_be_immutable
class PagedActorsListView extends StatefulWidget {
  final ValueChanged<Actor> onActorsClicked;
  Map<String, dynamic> parameters;

  PagedActorsListView(this.parameters, {required this.onActorsClicked});

  @override
  _PagedActorsItemsListViewViewState createState() =>
      _PagedActorsItemsListViewViewState();
}

class _PagedActorsItemsListViewViewState extends State<PagedActorsListView> {
  _PagedActorsItemsListViewViewState();

  final ScrollController? controller = ScrollController();

  final _pagingController = PagingController<int, Actor>(
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
  void didUpdateWidget(PagedActorsListView oldWidget) {
    _pagingController.refresh();
    super.didUpdateWidget(oldWidget);
  }

  Future<void> _fetchPage(int pageKey) async {
    try {
      var parameters = widget.parameters;

      parameters.putIfAbsent(EndPointParameter.PAGE, () => pageKey.toString());
      parameters[EndPointParameter.PAGE] = pageKey.toString();

      var items = await locator<ActorsRepository>().fetchActorsList(parameters);

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
    return ViewModelBuilder<ActorsListViewModel>.reactive(
        viewModelBuilder: () => ActorsListViewModel(),
        builder: (context, model, child) => PagedListView.separated(
              physics: BouncingScrollPhysics(),
              scrollController: controller,
              pagingController: _pagingController,
              builderDelegate: PagedChildBuilderDelegate<Actor>(
                itemBuilder: (context, actor, index) => ActorTile(
                  actor: actor,
                  onChanged: (value) {},
                ),
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
            ));
  }
}
