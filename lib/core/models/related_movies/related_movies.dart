import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'related_movies.g.dart';

/// An example genre model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class RelatedMovies
    implements Built<RelatedMovies, RelatedMoviesBuilder> {
  String? get id;

  String? get title;

  String? get img;
  String? get thumb;

  RelatedMovies._();

  String toJson() {
    return json
        .encode(serializers.serializeWith(RelatedMovies.serializer, this));
  }

  factory RelatedMovies.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      RelatedMovies.serializer,
      map,
    )!;
  }
  static Serializer<RelatedMovies> get serializer => _$relatedMoviesSerializer;

  factory RelatedMovies([void Function(RelatedMoviesBuilder)? updates]) =
      _$RelatedMovies;
}
