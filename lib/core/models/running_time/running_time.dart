import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

import '../serializers.dart';

part 'running_time.g.dart';

/// An example runningtime model that should be serialized.
///   -  : means that its ok if the value is null
///   - @BuiltValueField: is the key that is in the JSON you
///     receive from an API
///

abstract class RunningTime implements Built<RunningTime, RunningTimeBuilder> {
  int? get hours;

  int? get minutes;

  RunningTime._();

  String toJson() {
    return json.encode(serializers.serializeWith(RunningTime.serializer, this));
  }

  factory RunningTime.fromJson(String jsonString) {
    return serializers.deserializeWith(
      RunningTime.serializer,
      json.decode(jsonString),
    )!;
  }

  factory RunningTime.fromMap(Map<String, dynamic>? map) {
    return serializers.deserializeWith(
      RunningTime.serializer,
      map,
    )!;
  }

  static Serializer<RunningTime> get serializer => _$runningTimeSerializer;

  factory RunningTime([void Function(RunningTimeBuilder)? updates]) =
      _$RunningTime;
}
