import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:movieapp/core/services/connectivity/connectivity_service.dart';
import 'package:movieapp/core/services/connectivity/connectivity_service_impl.dart';
import 'package:movieapp/core/services/http/http_service.dart';
import 'package:movieapp/core/services/http/http_service_impl.dart';
import 'package:movieapp/core/services/key_storage/key_storage_service.dart';
import 'package:movieapp/core/services/key_storage/key_storage_service_impl.dart';
import 'package:movieapp/core/services/navigation/navigation_service.dart';
import 'package:movieapp/core/services/navigation/navigation_service_impl.dart';
import 'package:movieapp/core/utils/file_helper.dart';

import 'core/data_sources/actors/actors_remote_data_source.dart';
import 'core/data_sources/cast/cast_data_source.dart';
import 'core/data_sources/movies/movies_remote_data_source.dart';
import 'core/data_sources/related_movies/related_movies_remote_data_source.dart';
import 'core/data_sources/token/token_remote_data_source.dart';
import 'core/data_sources/users/users_remote_data_source.dart';
import 'core/repositories/actors_repository/actors_repository.dart';
import 'core/repositories/cast_repository/cast_repository.dart';
import 'core/repositories/movies_repository/movies_repository.dart';
import 'core/repositories/related_movies_repository/related_movies_repository.dart';
import 'core/repositories/token_repository/token_repository.dart';
import 'core/repositories/users_repository/users_repository.dart';

GetIt locator = GetIt.instance;

/// Setup function that is run before the App is run.
///   - Sets up singletons that can be called from anywhere
/// in the app by using locator<Service>() call.
///   - Also sets up factor methods for view models.

Future<void> setupLocator() async {
  // Services

  locator.registerLazySingleton<NavigationService>(
    () => NavigationServiceImpl(),
  );

  locator.registerLazySingleton<ConnectivityService>(
    () => ConnectivityServiceImpl(),
  );

  locator.registerLazySingleton<HttpService>(() => HttpServiceImpl());

  // Data sources

  locator.registerLazySingleton<MoviesRemoteDataSource>(
    () => MoviesRemoteDataSourceImpl(),
  );

  locator.registerLazySingleton<ActorsRemoteDataSource>(
    () => ActorsRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<TokenRemoteDataSource>(
    () => TokenRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<RelatedMoviesRemoteDataSource>(
    () => RelatedMoviesRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<CastRemoteDataSource>(
    () => CastRemoteDataSourceImpl(),
  );
  locator.registerLazySingleton<UsersRemoteDataSource>(
    () => UsersRemoteDataSourceImpl(),
  );

  locator.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl());

  locator.registerLazySingleton<ActorsRepository>(() => ActorsRepositoryImpl());
  locator.registerLazySingleton<TokenRepository>(() => TokenRepositoryImpl());
  locator.registerLazySingleton<RelatedMoviesRepository>(
      () => RelatedMoviesRepositoryImpl());
  locator.registerLazySingleton<CastRepository>(() => CastRepositoryImpl());
  locator.registerLazySingleton<UsersRepository>(() => UsersRepositoryImpl());

  await _setupSharedPreferences();

  // Utils
  locator.registerLazySingleton<FileHelper>(() => FileHelperImpl());
}

Future<void> _setupSharedPreferences() async {
  final instance = await KeyStorageServiceImpl.getInstance();
  locator.registerLazySingleton<KeyStorageService>(() => instance!);
}
