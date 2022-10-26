// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_movies.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RelatedMovies> _$relatedMoviesSerializer =
    new _$RelatedMoviesSerializer();

class _$RelatedMoviesSerializer implements StructuredSerializer<RelatedMovies> {
  @override
  final Iterable<Type> types = const [RelatedMovies, _$RelatedMovies];
  @override
  final String wireName = 'RelatedMovies';

  @override
  Iterable<Object?> serialize(Serializers serializers, RelatedMovies object,
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
    return result;
  }

  @override
  RelatedMovies deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RelatedMoviesBuilder();

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
      }
    }

    return result.build();
  }
}

class _$RelatedMovies extends RelatedMovies {
  @override
  final String? id;
  @override
  final String? title;
  @override
  final String? img;
  @override
  final String? thumb;

  factory _$RelatedMovies([void Function(RelatedMoviesBuilder)? updates]) =>
      (new RelatedMoviesBuilder()..update(updates))._build();

  _$RelatedMovies._({this.id, this.title, this.img, this.thumb}) : super._();

  @override
  RelatedMovies rebuild(void Function(RelatedMoviesBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RelatedMoviesBuilder toBuilder() => new RelatedMoviesBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RelatedMovies &&
        id == other.id &&
        title == other.title &&
        img == other.img &&
        thumb == other.thumb;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, id.hashCode), title.hashCode), img.hashCode),
        thumb.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RelatedMovies')
          ..add('id', id)
          ..add('title', title)
          ..add('img', img)
          ..add('thumb', thumb))
        .toString();
  }
}

class RelatedMoviesBuilder
    implements Builder<RelatedMovies, RelatedMoviesBuilder> {
  _$RelatedMovies? _$v;

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

  RelatedMoviesBuilder();

  RelatedMoviesBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _title = $v.title;
      _img = $v.img;
      _thumb = $v.thumb;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RelatedMovies other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RelatedMovies;
  }

  @override
  void update(void Function(RelatedMoviesBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RelatedMovies build() => _build();

  _$RelatedMovies _build() {
    final _$result = _$v ??
        new _$RelatedMovies._(id: id, title: title, img: img, thumb: thumb);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
