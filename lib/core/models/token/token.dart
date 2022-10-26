import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'token.g.dart';

/// An example movie model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Token implements Built<Token, TokenBuilder> {
  String? get status;

  String? get message;

  String? get token;

  Token._();

  String toJson() {
    return json.encode(serializers.serializeWith(Token.serializer, this));
  }

  factory Token.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Token.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Token.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Token.serializer,
      map,
    )!;
  }

  static Serializer<Token> get serializer => _$tokenSerializer;

  factory Token([void Function(TokenBuilder)? updates]) = _$Token;
}
