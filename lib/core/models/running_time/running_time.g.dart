// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'running_time.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RunningTime> _$runningTimeSerializer = new _$RunningTimeSerializer();

class _$RunningTimeSerializer implements StructuredSerializer<RunningTime> {
  @override
  final Iterable<Type> types = const [RunningTime, _$RunningTime];
  @override
  final String wireName = 'RunningTime';

  @override
  Iterable<Object?> serialize(Serializers serializers, RunningTime object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.hours;
    if (value != null) {
      result
        ..add('hours')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.minutes;
    if (value != null) {
      result
        ..add('minutes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    return result;
  }

  @override
  RunningTime deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RunningTimeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'hours':
          result.hours = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'minutes':
          result.minutes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
      }
    }

    return result.build();
  }
}

class _$RunningTime extends RunningTime {
  @override
  final int? hours;
  @override
  final int? minutes;

  factory _$RunningTime([void Function(RunningTimeBuilder)? updates]) =>
      (new RunningTimeBuilder()..update(updates))._build();

  _$RunningTime._({this.hours, this.minutes}) : super._();

  @override
  RunningTime rebuild(void Function(RunningTimeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RunningTimeBuilder toBuilder() => new RunningTimeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RunningTime &&
        hours == other.hours &&
        minutes == other.minutes;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, hours.hashCode), minutes.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RunningTime')
          ..add('hours', hours)
          ..add('minutes', minutes))
        .toString();
  }
}

class RunningTimeBuilder implements Builder<RunningTime, RunningTimeBuilder> {
  _$RunningTime? _$v;

  int? _hours;
  int? get hours => _$this._hours;
  set hours(int? hours) => _$this._hours = hours;

  int? _minutes;
  int? get minutes => _$this._minutes;
  set minutes(int? minutes) => _$this._minutes = minutes;

  RunningTimeBuilder();

  RunningTimeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _hours = $v.hours;
      _minutes = $v.minutes;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RunningTime other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RunningTime;
  }

  @override
  void update(void Function(RunningTimeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RunningTime build() => _build();

  _$RunningTime _build() {
    final _$result = _$v ?? new _$RunningTime._(hours: hours, minutes: minutes);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
