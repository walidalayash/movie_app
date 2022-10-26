import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../core/services/navigation/navigation_service.dart';
import '../../../locator.dart';
import '../../router.gr.dart';

class StartUpViewModel extends BaseViewModel {
  BuildContext? context;

  Future handleStartUpLogic(BuildContext context) async {
    this.context = context;
    setBusy(true);

    await Future.delayed(Duration(milliseconds: 800));

    setBusy(false);

    await loadHome();
  }

  Future<void> loadHome() async {
    locator<NavigationService>()
        .popAllAndPushNamed(CustomerMainViewRoute(), context!);
  }
}
