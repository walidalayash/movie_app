import 'dart:async';

import '../../../locator.dart';
import '../../constant/api_routes.dart';

import '../../models/cast/cast.dart';
import '../../services/http/http_service.dart';

abstract class CastRemoteDataSource {
  Future<Cast> fetchCast([Map<String, dynamic>? parameters]);

  Future<List<Cast>> fetchCastList(String id,
      [Map<String, dynamic>? parameters]);
}

class CastRemoteDataSourceImpl implements CastRemoteDataSource {
  final HttpService? httpService = locator<HttpService>();

  @override
  Future<Cast> fetchCast([Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> restData = await (httpService!
        .getHttp(ApiRoutes.related_movie(parameters!['id']), parameters));

    return Cast.fromMap(restData['cast']);
  }

  @override
  Future<List<Cast>> fetchCastList(String id,
      [Map<String, dynamic>? parameters]) async {
    Map<String, dynamic> jsonData =
        await httpService!.getHttp(ApiRoutes.related_movie(id), parameters);

    var list = jsonData['cast'] as List<dynamic>;
    print(list);

    var items = list.map<Cast>((vendorMap) => Cast.fromMap(vendorMap)).toList();

    return items;
  }
}
