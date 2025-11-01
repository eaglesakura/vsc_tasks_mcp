// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_definition_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$InputDefinitionDto {

@JsonKey(name: "id") String get id;@JsonKey(name: "description") String? get description;@JsonKey(name: "type") String? get type;@JsonKey(name: "options") List<dynamic>? get options;
/// Create a copy of InputDefinitionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InputDefinitionDtoCopyWith<InputDefinitionDto> get copyWith => _$InputDefinitionDtoCopyWithImpl<InputDefinitionDto>(this as InputDefinitionDto, _$identity);

  /// Serializes this InputDefinitionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputDefinitionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,type,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'InputDefinitionDto(id: $id, description: $description, type: $type, options: $options)';
}


}

/// @nodoc
abstract mixin class $InputDefinitionDtoCopyWith<$Res>  {
  factory $InputDefinitionDtoCopyWith(InputDefinitionDto value, $Res Function(InputDefinitionDto) _then) = _$InputDefinitionDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "description") String? description,@JsonKey(name: "type") String? type,@JsonKey(name: "options") List<dynamic>? options
});




}
/// @nodoc
class _$InputDefinitionDtoCopyWithImpl<$Res>
    implements $InputDefinitionDtoCopyWith<$Res> {
  _$InputDefinitionDtoCopyWithImpl(this._self, this._then);

  final InputDefinitionDto _self;
  final $Res Function(InputDefinitionDto) _then;

/// Create a copy of InputDefinitionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? description = freezed,Object? type = freezed,Object? options = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [InputDefinitionDto].
extension InputDefinitionDtoPatterns on InputDefinitionDto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InputDefinitionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InputDefinitionDto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InputDefinitionDto value)  $default,){
final _that = this;
switch (_that) {
case _InputDefinitionDto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InputDefinitionDto value)?  $default,){
final _that = this;
switch (_that) {
case _InputDefinitionDto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "description")  String? description, @JsonKey(name: "type")  String? type, @JsonKey(name: "options")  List<dynamic>? options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InputDefinitionDto() when $default != null:
return $default(_that.id,_that.description,_that.type,_that.options);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "id")  String id, @JsonKey(name: "description")  String? description, @JsonKey(name: "type")  String? type, @JsonKey(name: "options")  List<dynamic>? options)  $default,) {final _that = this;
switch (_that) {
case _InputDefinitionDto():
return $default(_that.id,_that.description,_that.type,_that.options);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "id")  String id, @JsonKey(name: "description")  String? description, @JsonKey(name: "type")  String? type, @JsonKey(name: "options")  List<dynamic>? options)?  $default,) {final _that = this;
switch (_that) {
case _InputDefinitionDto() when $default != null:
return $default(_that.id,_that.description,_that.type,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _InputDefinitionDto extends InputDefinitionDto {
  const _InputDefinitionDto({@JsonKey(name: "id") required this.id, @JsonKey(name: "description") this.description, @JsonKey(name: "type") this.type, @JsonKey(name: "options") final  List<dynamic>? options}): _options = options,super._();
  factory _InputDefinitionDto.fromJson(Map<String, dynamic> json) => _$InputDefinitionDtoFromJson(json);

@override@JsonKey(name: "id") final  String id;
@override@JsonKey(name: "description") final  String? description;
@override@JsonKey(name: "type") final  String? type;
 final  List<dynamic>? _options;
@override@JsonKey(name: "options") List<dynamic>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of InputDefinitionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InputDefinitionDtoCopyWith<_InputDefinitionDto> get copyWith => __$InputDefinitionDtoCopyWithImpl<_InputDefinitionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InputDefinitionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InputDefinitionDto&&(identical(other.id, id) || other.id == id)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,description,type,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'InputDefinitionDto(id: $id, description: $description, type: $type, options: $options)';
}


}

/// @nodoc
abstract mixin class _$InputDefinitionDtoCopyWith<$Res> implements $InputDefinitionDtoCopyWith<$Res> {
  factory _$InputDefinitionDtoCopyWith(_InputDefinitionDto value, $Res Function(_InputDefinitionDto) _then) = __$InputDefinitionDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "id") String id,@JsonKey(name: "description") String? description,@JsonKey(name: "type") String? type,@JsonKey(name: "options") List<dynamic>? options
});




}
/// @nodoc
class __$InputDefinitionDtoCopyWithImpl<$Res>
    implements _$InputDefinitionDtoCopyWith<$Res> {
  __$InputDefinitionDtoCopyWithImpl(this._self, this._then);

  final _InputDefinitionDto _self;
  final $Res Function(_InputDefinitionDto) _then;

/// Create a copy of InputDefinitionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? description = freezed,Object? type = freezed,Object? options = freezed,}) {
  return _then(_InputDefinitionDto(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,
  ));
}


}

// dart format on
