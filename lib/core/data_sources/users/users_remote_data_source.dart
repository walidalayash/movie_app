import 'dart:async';

import '../../../locator.dart';
import '../../constant/api_routes.dart';

import '../../models/user/user.dart';
import '../../services/http/http_service.dart';

abstract class UsersRemoteDataSource {
  Future<User> fetchUser([Map<String, dynamic>? parameters]);

  Future<List<User>> fetchUserList([Map<String, dynamic>? parameters]);
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final HttpService? httpService = locator<HttpService>();

  @override
  Future<User> fetchUser([Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData =
        await (httpService!.getHttp(ApiRoutes.user_info, parameters));

    return User.fromMap(restData);
  }

  @override
  Future<List<User>> fetchUserList([Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> jsonData =
        await httpService!.getHttp(ApiRoutes.user_info, parameters);

    var list = jsonData as List<dynamic>;

    var items = list.map<User>((vendorMap) => User.fromMap(vendorMap)).toList();

    return items;
  }
}
