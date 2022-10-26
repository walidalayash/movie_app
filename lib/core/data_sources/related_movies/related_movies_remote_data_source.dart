import 'dart:async';

import '../../../locator.dart';
import '../../constant/api_routes.dart';

import '../../models/related_movies/related_movies.dart';
import '../../services/http/http_service.dart';

abstract class RelatedMoviesRemoteDataSource {
  Future<RelatedMovies> fetchRelatedMovies(String id,
      [Map<String, dynamic>? parameters]);

  Future<List<RelatedMovies>> fetchRelatedMoviesList(String id,
      [Map<String, dynamic>? parameters]);
}

class RelatedMoviesRemoteDataSourceImpl
    implements RelatedMoviesRemoteDataSource {
  final HttpService? httpService = locator<HttpService>();

  @override
  Future<RelatedMovies> fetchRelatedMovies(String id,
      [Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData =
        await (httpService!.getHttp(ApiRoutes.related_movie(id), parameters));
    print(restData);
    return RelatedMovies.fromMap(restData['related_movies']);
  }

  @override
  Future<List<RelatedMovies>> fetchRelatedMoviesList(String id,
      [Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> jsonData =
        await httpService!.getHttp(ApiRoutes.related_movie(id), parameters);

    var list = jsonData['related_movies'] as List<dynamic>;

    var items = list
        .map<RelatedMovies>((vendorMap) => RelatedMovies.fromMap(vendorMap))
        .toList();
    return items;
  }
}
