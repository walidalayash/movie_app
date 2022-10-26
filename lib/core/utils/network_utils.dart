import 'dart:convert' as convert;

import 'package:dio/dio.dart';
// ignore: library_prefixes
import 'package:flutter/foundation.dart';

import '../../locator.dart';
import '../exceptions/auth_exception.dart';
import '../exceptions/network_exception.dart';
import '../exceptions/server_exception.dart';
import '../exceptions/token_expired_exception.dart';
import '../exceptions/unauthorized_exception.dart';
import '../services/key_storage/key_storage_service.dart';

void checkForNetworkExceptions(Response response) {
  if (response.statusCode == 401) {
    locator<KeyStorageService>().removeEveryThing();

    throw UnauthorizedException('Unauthorized user Error');
  }

  if (response.statusCode == 403) {
    locator<KeyStorageService>().removeEveryThing();

    throw UnauthorizedException('UnauthorizedAccess user Error');
  }

  if (response.statusCode == 500) {
    print('Server Error');
    throw ServerException('Server Error');
  }

  if (response.statusCode != 200) {
    throw NetworkException('Failed to connect to internet');
  }
}

Future<void> AuthCheck(jsonData) async {
  if (jsonData is Map<String, dynamic>) {
    if (jsonData.containsKey('code')) {
      if (jsonData['code'] == 3009) {
        throw AuthException('Token not provided');
      }
    }

    if (jsonData.containsKey('code')) {
      if (jsonData['code'] == 3010) {
        throw TokenExpiredException('Token expired');
      }
    }
    if (jsonData.containsKey('code')) {
      if (jsonData['code'] == 3011) {
        throw TokenExpiredException('Token invalid');
      }
    }
  }
}

void showLoadingProgress(received, total) {
  if (total != -1) {
    debugPrint('${(received / total * 100).toStringAsFixed(0)}%');
  }
}

dynamic decodeResponseBodyToJson(String body) {
  try {
    final data = convert.jsonDecode(body);
    return data;
  } on FormatException catch (e) {
    debugPrint('Network Utils: Failed to decode response body ${e.message}');
    throw NetworkException(e.message);
  }
}
