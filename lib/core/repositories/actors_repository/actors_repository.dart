import 'dart:async';

import 'package:logging/logging.dart';

import '../../../locator.dart';
import '../../data_sources/actors/actors_remote_data_source.dart';
import '../../exceptions/cache_exception.dart';
import '../../exceptions/network_exception.dart';
import '../../exceptions/repository_exception.dart';
import '../../models/actor/actor.dart';
import '../../services/connectivity/connectivity_service.dart';

abstract class ActorsRepository {
  Future<Actor> fetchActor([Map<String, dynamic>? parameters]);

  Future<List<Actor>> fetchActorsList([Map<String, dynamic>? parameters]);
}

class ActorsRepositoryImpl implements ActorsRepository {
  final ActorsRemoteDataSource? remoteDataSource =
      locator<ActorsRemoteDataSource>();
  final ConnectivityService? connectivityService =
      locator<ConnectivityService>();

  final _log = Logger('ActorsRepositoryImpl');

  @override
  Future<Actor> fetchActor([Map<String, dynamic>? parameters]) async {
    try {
      if (await connectivityService!.isConnected) {
        final data = await remoteDataSource!.fetchActor(parameters);

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
  Future<List<Actor>> fetchActorsList(
      [Map<String, dynamic>? parameters]) async {
    try {
      final items = await remoteDataSource!.fetchActorsList(parameters);

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
