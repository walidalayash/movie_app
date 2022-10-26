import 'package:flutter/cupertino.dart';
import 'package:movieapp/core/models/actor/actor.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/services/navigation/navigation_service.dart';
import '../../../../locator.dart';
import '../../../router.gr.dart';

class ActorTileViewModel extends BaseViewModel {
  Actor? actor;

  void init(Actor actor) {
    this.actor = actor;
  }

  Future<void> moveToActorViewRoute(BuildContext context) async {
    await locator<NavigationService>().pushNamed(ActorViewRoute(actor:actor!), context);
  }
}
