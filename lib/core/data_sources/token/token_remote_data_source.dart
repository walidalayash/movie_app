import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:movieapp/core/models/token/token.dart';

import '../../../locator.dart';
import '../../constant/api_routes.dart';

import '../../services/http/http_service.dart';

abstract class TokenRemoteDataSource {
  Future<void> fetchToken(String email, String password,
      [Map<String, dynamic>? parameters]);
}

class TokenRemoteDataSourceImpl implements TokenRemoteDataSource {
  final HttpService? httpService = locator<HttpService>();

  @override
  Future<void> fetchToken(String email, String password,
      [Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData = await (httpService!.postHttp(
        ApiRoutes.token_user, {'email': email, 'password': password}));

    await FlutterSecureStorage().write(key: 'token', value: restData['token']);
  }
}
