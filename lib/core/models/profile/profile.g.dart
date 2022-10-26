// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Profile> _$profileSerializer = new _$ProfileSerializer();

class _$ProfileSerializer implements StructuredSerializer<Profile> {
  @override
  final Iterable<Type> types = const [Profile, _$Profile];
  @override
  final String wireName = 'Profile';

  @override
  Iterable<Object?> serialize(Serializers serializers, Profile object,
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
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.age;
    if (value != null) {
      result
        ..add('age')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.classifications;
    if (value != null) {
      result
        ..add('classifications')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.favorite_movies;
    if (value != null) {
      result
        ..add('favorite_movies')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Movie)));
    }
    return result;
  }

  @override
  Profile deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProfileBuilder();

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
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'age':
          result.age = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'classifications':
          result.classifications = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'favorite_movies':
          result.favorite_movies.replace(serializers.deserialize(value,
              specifiedType: const FullType(Movie))! as Movie);
          break;
      }
    }

    return result.build();
  }
}

class _$Profile extends Profile {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? email;
  @override
  final String? age;
  @override
  final String? classifications;
  @override
  final Movie? favorite_movies;

  factory _$Profile([void Function(ProfileBuilder)? updates]) =>
      (new ProfileBuilder()..update(updates))._build();

  _$Profile._(
      {this.id,
      this.name,
      this.email,
      this.age,
      this.classifications,
      this.favorite_movies})
      : super._();

  @override
  Profile rebuild(void Function(ProfileBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProfileBuilder toBuilder() => new ProfileBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Profile &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        age == other.age &&
        classifications == other.classifications &&
        favorite_movies == other.favorite_movies;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc($jc(0, id.hashCode), name.hashCode), email.hashCode),
                age.hashCode),
            classifications.hashCode),
        favorite_movies.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Profile')
          ..add('id', id)
          ..add('name', name)
          ..add('email', email)
          ..add('age', age)
          ..add('classifications', classifications)
          ..add('favorite_movies', favorite_movies))
        .toString();
  }
}

class ProfileBuilder implements Builder<Profile, ProfileBuilder> {
  _$Profile? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _age;
  String? get age => _$this._age;
  set age(String? age) => _$this._age = age;

  String? _classifications;
  String? get classifications => _$this._classifications;
  set classifications(String? classifications) =>
      _$this._classifications = classifications;

  MovieBuilder? _favorite_movies;
  MovieBuilder get favorite_movies =>
      _$this._favorite_movies ??= new MovieBuilder();
  set favorite_movies(MovieBuilder? favorite_movies) =>
      _$this._favorite_movies = favorite_movies;

  ProfileBuilder();

  ProfileBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _email = $v.email;
      _age = $v.age;
      _classifications = $v.classifications;
      _favorite_movies = $v.favorite_movies?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Profile other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Profile;
  }

  @override
  void update(void Function(ProfileBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Profile build() => _build();

  _$Profile _build() {
    _$Profile _$result;
    try {
      _$result = _$v ??
          new _$Profile._(
              id: id,
              name: name,
              email: email,
              age: age,
              classifications: classifications,
              favorite_movies: _favorite_movies?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'favorite_movies';
        _favorite_movies?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Profile', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
