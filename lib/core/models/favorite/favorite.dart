import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../running_time/running_time.dart';
import '../serializers.dart';
part 'favorite.g.dart';

/// An example movie model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Favorite implements Built<Favorite, FavoriteBuilder> {
  String? get id; // uuid

  String? get title;

  String? get img;

  String? get thumb;

  String? get release_date;

  String? get description;

  bool? get is_disabled;

  RunningTime? get running_time;

  DateTime? get created_at;

  Favorite._();

  String toJson() {
    return json.encode(serializers.serializeWith(Favorite.serializer, this));
  }

  factory Favorite.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Favorite.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Favorite.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Favorite.serializer,
      map,
    )!;
  }

  static Serializer<Favorite> get serializer => _$favoriteSerializer;

  factory Favorite([void Function(FavoriteBuilder)? updates]) = _$Favorite;
}
