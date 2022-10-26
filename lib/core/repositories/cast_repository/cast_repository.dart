import 'dart:async';

import 'package:logging/logging.dart';

import '../../../locator.dart';
import '../../data_sources/cast/cast_data_source.dart';
import '../../exceptions/cache_exception.dart';
import '../../exceptions/network_exception.dart';
import '../../exceptions/repository_exception.dart';

import '../../models/cast/cast.dart';
import '../../services/connectivity/connectivity_service.dart';

abstract class CastRepository {
  Future<Cast> fetchCast([Map<String, dynamic>? parameters]);

  Future<List<Cast>> fetchCastList(String id,
      [Map<String, dynamic>? parameters]);
}

class CastRepositoryImpl implements CastRepository {
  final CastRemoteDataSource? remoteDataSource =
      locator<CastRemoteDataSource>();
  final ConnectivityService? connectivityService =
      locator<ConnectivityService>();

  final _log = Logger('MoviesDeatilsRepositoryImpl');

  @override
  Future<Cast> fetchCast([Map<String, dynamic>? parameters]) async {
    try {
      if (await connectivityService!.isConnected) {
        final data = await remoteDataSource!.fetchCast(parameters);

        return data;
      }
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch locally');
      throw RepositoryException(e.message);
    }

    throw RepositoryException('null');
  }

  @override
  Future<List<Cast>> fetchCastList(String id,
      [Map<String, dynamic>? parameters]) async {
    try {
      final items = await remoteDataSource!.fetchCastList(id);

      return items;
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch posts remotely');
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch posts locally');
      throw RepositoryException(e.message);
    }
  }
}
