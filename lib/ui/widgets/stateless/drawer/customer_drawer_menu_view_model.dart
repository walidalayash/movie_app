import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/services/key_storage/key_storage_service.dart';
import '../../../../core/services/navigation/navigation_service.dart';
import '../../../../locator.dart';
import '../../../router.gr.dart';

class CustomerDrawerMenuViewModel extends BaseViewModel {
  final KeyStorageService? keyStorageService = locator<KeyStorageService>();
  final NavigationService? _navigationService = locator<NavigationService>();
  String? token;
  Future<void> moveToLoginViewRoute(BuildContext context) async {
    await locator<NavigationService>().pushNamed(LoginScreenRoute(), context);
  }

  Future<void> moveToFavoriteViewRoute(BuildContext context) async {
    await locator<NavigationService>().pushNamed(FavoriteViewRoute(), context);
  }

  Future<void> moveToSettingsViewRoute(BuildContext context) async {
    await locator<NavigationService>().pushNamed(SettingsViewRoute(), context);
  }

  Future<void> init() async {
    setBusy(true);
    token = await FlutterSecureStorage().read(key: 'token');
    setBusy(false);
  }

//
  void showCustomerMain(BuildContext context) {
    Navigator.of(context).pop();
  }
}
