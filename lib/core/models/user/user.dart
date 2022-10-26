import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';

import '../serializers.dart';

part 'user.g.dart';

/// An example movie model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class User implements Built<User, UserBuilder> {
  String? get id; // uuid

  String? get name;

  String? get phone;

  String? get email;

  String? get password;

  BuiltList<String>? get role;

  bool? get is_disabled;

  DateTime? get created_at;

  DateTime? get updated_at;
  User._();

  String toJson() {
    return json.encode(serializers.serializeWith(User.serializer, this));
  }

  factory User.fromJson(String jsonString) {
    return serializers.deserializeWith(
      User.serializer,
      json.decode(jsonString),
    )!;
  }

  factory User.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      User.serializer,
      map,
    )!;
  }

  static Serializer<User> get serializer => _$userSerializer;

  factory User([void Function(UserBuilder)? updates]) = _$User;
}
