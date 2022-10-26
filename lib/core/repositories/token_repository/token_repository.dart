import 'dart:async';

import 'package:logging/logging.dart';
import 'package:movieapp/core/models/token/token.dart';

import '../../../locator.dart';
import '../../data_sources/token/token_remote_data_source.dart';
import '../../exceptions/cache_exception.dart';
import '../../exceptions/network_exception.dart';
import '../../exceptions/repository_exception.dart';
import '../../services/connectivity/connectivity_service.dart';

abstract class TokenRepository {
  Future<void> fetchToken(String email, String password,
      [Map<String, dynamic>? parameters]);
}

class TokenRepositoryImpl implements TokenRepository {
  final TokenRemoteDataSource? remoteDataSource =
      locator<TokenRemoteDataSource>();
  final ConnectivityService? connectivityService =
      locator<ConnectivityService>();

  final _log = Logger('TokenRepositoryImpl');

  @override
  Future<void> fetchToken(String email, String password,
      [Map<String, dynamic>? parameters]) async {
    try {
      if (await connectivityService!.isConnected) {
        await remoteDataSource!.fetchToken(email, password, parameters);
      }
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch locally');
      throw RepositoryException(e.message);
    }
  }
}
