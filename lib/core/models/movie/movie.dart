import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:movieapp/core/models/genre/genre.dart';

import '../cast/cast.dart';
import '../related_movies/related_movies.dart';
import '../running_time/running_time.dart';
import '../serializers.dart';

part 'movie.g.dart';

/// An example movie model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class Movie implements Built<Movie, MovieBuilder> {
  String? get id; // uuid

  String? get title;

  String? get img;

  String? get thumb;

  String? get release_date;

  String? get description;
  bool? get is_disabled;
  RunningTime? get running_time;
  DateTime? get created_at;
  int? get rental_rate;
  String? get rating;
  String? get updated_at;
  String? get box_office;
  BuiltList<RelatedMovies>? get related_movies;
  BuiltList<Cast>? get cast;

  BuiltList<Genre>? get genres;
  Movie._();

  String toJson() {
    return json.encode(serializers.serializeWith(Movie.serializer, this));
  }

  factory Movie.fromJson(String jsonString) {
    return serializers.deserializeWith(
      Movie.serializer,
      json.decode(jsonString),
    )!;
  }

  factory Movie.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      Movie.serializer,
      map,
    )!;
  }

  static Serializer<Movie> get serializer => _$movieSerializer;

  factory Movie([void Function(MovieBuilder)? updates]) = _$Movie;
}
