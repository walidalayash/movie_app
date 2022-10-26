import 'dart:async';

import 'package:logging/logging.dart';

import '../../../locator.dart';
import '../../data_sources/users/users_remote_data_source.dart';
import '../../exceptions/cache_exception.dart';
import '../../exceptions/network_exception.dart';
import '../../exceptions/repository_exception.dart';

import '../../models/user/user.dart';
import '../../services/connectivity/connectivity_service.dart';

abstract class UsersRepository {
  Future<User> fetchUser([Map<String, dynamic>? parameters]);

  Future<List<User>> fetchUserList([Map<String, dynamic>? parameters]);
}

class UsersRepositoryImpl implements UsersRepository {
  final UsersRemoteDataSource? remoteDataSource =
      locator<UsersRemoteDataSource>();
  final ConnectivityService? connectivityService =
      locator<ConnectivityService>();

  final _log = Logger('UsersRepositoryImpl');

  @override
  Future<User> fetchUser([Map<String, dynamic>? parameters]) async {
    try {
      if (await connectivityService!.isConnected) {
        final data = await remoteDataSource!.fetchUser(parameters);

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
  Future<List<User>> fetchUserList([Map<String, dynamic>? parameters]) async {
    try {
      final items = await remoteDataSource!.fetchUserList(parameters);

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
