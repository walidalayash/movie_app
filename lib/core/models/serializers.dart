library serializers;

import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:movieapp/core/models/actor/actor.dart';
import 'package:movieapp/core/models/related_movies/related_movies.dart';
import 'package:movieapp/core/models/running_time/running_time.dart';
import 'package:built_collection/built_collection.dart';
import 'package:movieapp/core/models/user/user.dart';

import 'cast/cast.dart';
import 'genre/genre.dart';
import 'movie/movie.dart';

part 'serializers.g.dart';

/// List of models that will have a serializer generated for them.
///   - Usually you only add models here that you expect to fetch from some API
@SerializersFor([
  Genre,
  Movie,
  Actor,
  RunningTime,
  User,
  RelatedMovies,
  Cast,
])

/// Can add additional plugins that will serialize types like [DateTime]
///   - It is also possible to write your own Serializer plugins for type that
///     are not supported by default.
///   - For Example: https://github.com/google/built_value.dart/issues/543
///     implements [SerializerPlugin] and writes a serializer for Firebase
///     Datetime that converts TimeStamp or DateTime to integers.
Serializers serializers = (_$serializers.toBuilder()
      ..addPlugin(StandardJsonPlugin())
      ..add(Iso8601DateTimeSerializer()))
    .build();
