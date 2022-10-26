import 'dart:async';

import 'package:logging/logging.dart';

import '../../../locator.dart';
import '../../data_sources/related_movies/related_movies_remote_data_source.dart';
import '../../exceptions/cache_exception.dart';
import '../../exceptions/network_exception.dart';
import '../../exceptions/repository_exception.dart';

import '../../models/related_movies/related_movies.dart';
import '../../services/connectivity/connectivity_service.dart';

abstract class RelatedMoviesRepository {
  // Future<RelatedMovies> fetchRelatedMovies([Map<String, dynamic>? parameters]);

  Future<List<RelatedMovies>> fetchRelatedMoviesList(String id,
      [Map<String, dynamic>? parameters]);
}

class RelatedMoviesRepositoryImpl implements RelatedMoviesRepository {
  final RelatedMoviesRemoteDataSource? remoteDataSource =
      locator<RelatedMoviesRemoteDataSource>();
  final ConnectivityService? connectivityService =
      locator<ConnectivityService>();

  final _log = Logger('RelatedMoviesRepositoryImpl');

  // @override
  // Future<RelatedMovies> fetchRelatedMovies(
  //     [Map<String, dynamic>? parameters]) async {
  //   try {
  //     if (await connectivityService!.isConnected) {
  //       final data = await remoteDataSource!.fetchRelatedMovies(parameters);

  //       return data;
  //     }
  //   } on NetworkException catch (e) {
  //     _log.severe('Failed to fetch remotely');
  //     throw RepositoryException(e.message);
  //   } on CacheException catch (e) {
  //     _log.severe('Failed to fetch locally');
  //     throw RepositoryException(e.message);
  //   }

  //   throw RepositoryException('null');
  // }

  @override
  Future<List<RelatedMovies>> fetchRelatedMoviesList(String id,
      [Map<String, dynamic>? parameters]) async {
    try {
      final items = await remoteDataSource!.fetchRelatedMoviesList(id);

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
