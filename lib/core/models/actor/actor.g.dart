// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'actor.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Actor> _$actorSerializer = new _$ActorSerializer();

class _$ActorSerializer implements StructuredSerializer<Actor> {
  @override
  final Iterable<Type> types = const [Actor, _$Actor];
  @override
  final String wireName = 'Actor';

  @override
  Iterable<Object?> serialize(Serializers serializers, Actor object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.img;
    if (value != null) {
      result
        ..add('img')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.thumb;
    if (value != null) {
      result
        ..add('thumb')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.created_at;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.updated_at;
    if (value != null) {
      result
        ..add('updated_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  Actor deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ActorBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'img':
          result.img = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'thumb':
          result.thumb = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'updated_at':
          result.updated_at = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$Actor extends Actor {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? img;
  @override
  final String? thumb;
  @override
  final DateTime? created_at;
  @override
  final DateTime? updated_at;

  factory _$Actor([void Function(ActorBuilder)? updates]) =>
      (new ActorBuilder()..update(updates))._build();

  _$Actor._(
      {this.id,
      this.name,
      this.img,
      this.thumb,
      this.created_at,
      this.updated_at})
      : super._();

  @override
  Actor rebuild(void Function(ActorBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ActorBuilder toBuilder() => new ActorBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Actor &&
        id == other.id &&
        name == other.name &&
        img == other.img &&
        thumb == other.thumb &&
        created_at == other.created_at &&
        updated_at == other.updated_at;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), img.hashCode),
                thumb.hashCode),
            created_at.hashCode),
        updated_at.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Actor')
          ..add('id', id)
          ..add('name', name)
          ..add('img', img)
          ..add('thumb', thumb)
          ..add('created_at', created_at)
          ..add('updated_at', updated_at))
        .toString();
  }
}

class ActorBuilder implements Builder<Actor, ActorBuilder> {
  _$Actor? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  String? _thumb;
  String? get thumb => _$this._thumb;
  set thumb(String? thumb) => _$this._thumb = thumb;

  DateTime? _created_at;
  DateTime? get created_at => _$this._created_at;
  set created_at(DateTime? created_at) => _$this._created_at = created_at;

  DateTime? _updated_at;
  DateTime? get updated_at => _$this._updated_at;
  set updated_at(DateTime? updated_at) => _$this._updated_at = updated_at;

  ActorBuilder();

  ActorBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _img = $v.img;
      _thumb = $v.thumb;
      _created_at = $v.created_at;
      _updated_at = $v.updated_at;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Actor other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Actor;
  }

  @override
  void update(void Function(ActorBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Actor build() => _build();

  _$Actor _build() {
    final _$result = _$v ??
        new _$Actor._(
            id: id,
            name: name,
            img: img,
            thumb: thumb,
            created_at: created_at,
            updated_at: updated_at);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
