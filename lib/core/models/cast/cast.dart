import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'cast.g.dart';

/// An example genre model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Cast implements Built<Cast, CastBuilder> {
  int? get id;

  String? get name;

  String? get img;
  String? get thumb;

  Cast._();

  String toJson() {
    return json.encode(serializers.serializeWith(Cast.serializer, this));
  }

  factory Cast.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Cast.serializer,
      map,
    )!;
  }
  static Serializer<Cast> get serializer => _$castSerializer;

  factory Cast([void Function(CastBuilder)? updates]) = _$Cast;
}
