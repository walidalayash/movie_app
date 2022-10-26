// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Favorite> _$favoriteSerializer = new _$FavoriteSerializer();

class _$FavoriteSerializer implements StructuredSerializer<Favorite> {
  @override
  final Iterable<Type> types = const [Favorite, _$Favorite];
  @override
  final String wireName = 'Favorite';

  @override
  Iterable<Object?> serialize(Serializers serializers, Favorite object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.title;
    if (value != null) {
      result
        ..add('title')
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
    value = object.release_date;
    if (value != null) {
      result
        ..add('release_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.is_disabled;
    if (value != null) {
      result
        ..add('is_disabled')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.running_time;
    if (value != null) {
      result
        ..add('running_time')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(RunningTime)));
    }
    value = object.created_at;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  Favorite deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new FavoriteBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'title':
          result.title = serializers.deserialize(value,
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
        case 'release_date':
          result.release_date = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_disabled':
          result.is_disabled = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'running_time':
          result.running_time.replace(serializers.deserialize(value,
              specifiedType: const FullType(RunningTime))! as RunningTime);
          break;
        case 'created_at':
          result.created_at = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$Favorite extends Favorite {
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? img;
  @override
  final String? thumb;
  @override
  final String? release_date;
  @override
  final String? description;
  @override
  final bool? is_disabled;
  @override
  final RunningTime? running_time;
  @override
  final DateTime? created_at;

  factory _$Favorite([void Function(FavoriteBuilder)? updates]) =>
      (new FavoriteBuilder()..update(updates))._build();

  _$Favorite._(
      {this.id,
      this.title,
      this.img,
      this.thumb,
      this.release_date,
      this.description,
      this.is_disabled,
      this.running_time,
      this.created_at})
      : super._();

  @override
  Favorite rebuild(void Function(FavoriteBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  FavoriteBuilder toBuilder() => new FavoriteBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Favorite &&
        id == other.id &&
        title == other.title &&
        img == other.img &&
        thumb == other.thumb &&
        release_date == other.release_date &&
        description == other.description &&
        is_disabled == other.is_disabled &&
        running_time == other.running_time &&
        created_at == other.created_at;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc($jc($jc(0, id.hashCode), title.hashCode),
                                img.hashCode),
                            thumb.hashCode),
                        release_date.hashCode),
                    description.hashCode),
                is_disabled.hashCode),
            running_time.hashCode),
        created_at.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Favorite')
          ..add('id', id)
          ..add('title', title)
          ..add('img', img)
          ..add('thumb', thumb)
          ..add('release_date', release_date)
          ..add('description', description)
          ..add('is_disabled', is_disabled)
          ..add('running_time', running_time)
          ..add('created_at', created_at))
        .toString();
  }
}

class FavoriteBuilder implements Builder<Favorite, FavoriteBuilder> {
  _$Favorite? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _img;
  String? get img => _$this._img;
  set img(String? img) => _$this._img = img;

  String? _thumb;
  String? get thumb => _$this._thumb;
  set thumb(String? thumb) => _$this._thumb = thumb;

  String? _release_date;
  String? get release_date => _$this._release_date;
  set release_date(String? release_date) => _$this._release_date = release_date;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _is_disabled;
  bool? get is_disabled => _$this._is_disabled;
  set is_disabled(bool? is_disabled) => _$this._is_disabled = is_disabled;

  RunningTimeBuilder? _running_time;
  RunningTimeBuilder get running_time =>
      _$this._running_time ??= new RunningTimeBuilder();
  set running_time(RunningTimeBuilder? running_time) =>
      _$this._running_time = running_time;

  DateTime? _created_at;
  DateTime? get created_at => _$this._created_at;
  set created_at(DateTime? created_at) => _$this._created_at = created_at;

  FavoriteBuilder();

  FavoriteBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _img = $v.img;
      _thumb = $v.thumb;
      _release_date = $v.release_date;
      _description = $v.description;
      _is_disabled = $v.is_disabled;
      _running_time = $v.running_time?.toBuilder();
      _created_at = $v.created_at;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Favorite other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Favorite;
  }

  @override
  void update(void Function(FavoriteBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Favorite build() => _build();

  _$Favorite _build() {
    _$Favorite _$result;
    try {
      _$result = _$v ??
          new _$Favorite._(
              id: id,
              title: title,
              img: img,
              thumb: thumb,
              release_date: release_date,
              description: description,
              is_disabled: is_disabled,
              running_time: _running_time?.build(),
              created_at: created_at);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'running_time';
        _running_time?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Favorite', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
