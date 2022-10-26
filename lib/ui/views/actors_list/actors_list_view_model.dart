import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/models/actor/actor.dart';
import '../../../core/repositories/actors_repository/actors_repository.dart';
import '../../../locator.dart';

class ActorsListViewModel extends BaseViewModel {
  BuildContext? context;

  List<Actor> actors_list = [];
  String? q = '';

  Future<void> init(BuildContext context) async {
    this.context = context;

    setBusy(true);

    actors_list = await locator<ActorsRepository>()
        .fetchActorsList({'paginate': '1000000'});

    setBusy(false);
  }
}
