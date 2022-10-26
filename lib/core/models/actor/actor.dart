import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'actor.g.dart';

/// An example actor model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Actor implements Built<Actor, ActorBuilder> {
  int? get id;

  String? get name;

  String? get img;

  String? get thumb;

  DateTime? get created_at;

  DateTime? get updated_at;

  Actor._();

  String toJson() {
    return json.encode(serializers.serializeWith(Actor.serializer, this));
  }

  factory Actor.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Actor.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Actor.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Actor.serializer,
      map,
    )!;
  }

  static Serializer<Actor> get serializer => _$actorSerializer;

  factory Actor([void Function(ActorBuilder)? updates]) = _$Actor;
}
