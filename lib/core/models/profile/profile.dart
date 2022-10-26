import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../movie/movie.dart';
import '../serializers.dart';

part 'profile.g.dart';

/// An example genre model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Profile implements Built<Profile, ProfileBuilder> {
  int? get id;

  String? get name;

  String? get email;

  String? get age;

  String? get classifications;

  Movie? get favorite_movies;
  Profile._();

  String toJson() {
    return json.encode(serializers.serializeWith(Profile.serializer, this));
  }

  factory Profile.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Profile.serializer,
      map,
    )!;
  }
  static Serializer<Profile> get serializer => _$profileSerializer;

  factory Profile([void Function(ProfileBuilder)? updates]) = _$Profile;
}
