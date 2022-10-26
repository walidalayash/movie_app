import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/services/navigation/navigation_service.dart';
import '../../../../locator.dart';
import '../../../core/models/user/user.dart';
import '../../../core/repositories/users_repository/users_repository.dart';
import '../../router.gr.dart';

class ProfileViewModel extends BaseViewModel {
  String? token;
  User? User_list;
  Future<void> moveToAddPhotoRoute(BuildContext context) async {
    await locator<NavigationService>().pushNamed(AddPhotosRoute(), context);
  }

  Future<void> moveToLoginViewRoute(BuildContext context) async {
    await locator<NavigationService>().pushNamed(LoginScreenRoute(), context);
  }

  Future<void> moveToFavoriteRoute(BuildContext context) async {
    await locator<NavigationService>().pushNamed(FavoriteViewRoute(), context);
  }

  Future<void> init(BuildContext context) async {
    setBusy(true);
    token = await FlutterSecureStorage().read(key: 'token');
    User_list = await locator<UsersRepository>().fetchUser();
    setBusy(false);
  }
}
