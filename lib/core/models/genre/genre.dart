import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';
import 'package:built_collection/built_collection.dart';

part 'genre.g.dart';

/// An example genre model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Genre implements Built<Genre, GenreBuilder> {
  int? get id;

  String? get name;

  String? get img;

  String? get thumb;

  DateTime? get created_at;

  DateTime? get updated_at;
  Genre._();

  String toJson() {
    return json.encode(serializers.serializeWith(Genre.serializer, this));
  }

  factory Genre.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Genre.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Genre.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Genre.serializer,
      map,
    )!;
  }

  static Serializer<Genre> get serializer => _$genreSerializer;

  factory Genre([void Function(GenreBuilder)? updates]) = _$Genre;
}
