// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mcp_options_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$McpOptionsDto {

@JsonKey(name: "tool") String get tool;@JsonKey(name: "description") String? get description;
/// Create a copy of McpOptionsDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$McpOptionsDtoCopyWith<McpOptionsDto> get copyWith => _$McpOptionsDtoCopyWithImpl<McpOptionsDto>(this as McpOptionsDto, _$identity);

  /// Serializes this McpOptionsDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is McpOptionsDto&&(identical(other.tool, tool) || other.tool == tool)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tool,description);

@override
String toString() {
  return 'McpOptionsDto(tool: $tool, description: $description)';
}


}

/// @nodoc
abstract mixin class $McpOptionsDtoCopyWith<$Res>  {
  factory $McpOptionsDtoCopyWith(McpOptionsDto value, $Res Function(McpOptionsDto) _then) = _$McpOptionsDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "tool") String tool,@JsonKey(name: "description") String? description
});




}
/// @nodoc
class _$McpOptionsDtoCopyWithImpl<$Res>
    implements $McpOptionsDtoCopyWith<$Res> {
  _$McpOptionsDtoCopyWithImpl(this._self, this._then);

  final McpOptionsDto _self;
  final $Res Function(McpOptionsDto) _then;

/// Create a copy of McpOptionsDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tool = null,Object? description = freezed,}) {
  return _then(_self.copyWith(
tool: null == tool ? _self.tool : tool // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [McpOptionsDto].
extension McpOptionsDtoPatterns on McpOptionsDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _McpOptionsDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _McpOptionsDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _McpOptionsDto value)  $default,){
final _that = this;
switch (_that) {
case _McpOptionsDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _McpOptionsDto value)?  $default,){
final _that = this;
switch (_that) {
case _McpOptionsDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "tool")  String tool, @JsonKey(name: "description")  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _McpOptionsDto() when $default != null:
return $default(_that.tool,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "tool")  String tool, @JsonKey(name: "description")  String? description)  $default,) {final _that = this;
switch (_that) {
case _McpOptionsDto():
return $default(_that.tool,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "tool")  String tool, @JsonKey(name: "description")  String? description)?  $default,) {final _that = this;
switch (_that) {
case _McpOptionsDto() when $default != null:
return $default(_that.tool,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _McpOptionsDto extends McpOptionsDto {
  const _McpOptionsDto({@JsonKey(name: "tool") required this.tool, @JsonKey(name: "description") this.description}): super._();
  factory _McpOptionsDto.fromJson(Map<String, dynamic> json) => _$McpOptionsDtoFromJson(json);

@override@JsonKey(name: "tool") final  String tool;
@override@JsonKey(name: "description") final  String? description;

/// Create a copy of McpOptionsDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$McpOptionsDtoCopyWith<_McpOptionsDto> get copyWith => __$McpOptionsDtoCopyWithImpl<_McpOptionsDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$McpOptionsDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _McpOptionsDto&&(identical(other.tool, tool) || other.tool == tool)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tool,description);

@override
String toString() {
  return 'McpOptionsDto(tool: $tool, description: $description)';
}


}

/// @nodoc
abstract mixin class _$McpOptionsDtoCopyWith<$Res> implements $McpOptionsDtoCopyWith<$Res> {
  factory _$McpOptionsDtoCopyWith(_McpOptionsDto value, $Res Function(_McpOptionsDto) _then) = __$McpOptionsDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "tool") String tool,@JsonKey(name: "description") String? description
});




}
/// @nodoc
class __$McpOptionsDtoCopyWithImpl<$Res>
    implements _$McpOptionsDtoCopyWith<$Res> {
  __$McpOptionsDtoCopyWithImpl(this._self, this._then);

  final _McpOptionsDto _self;
  final $Res Function(_McpOptionsDto) _then;

/// Create a copy of McpOptionsDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tool = null,Object? description = freezed,}) {
  return _then(_McpOptionsDto(
tool: null == tool ? _self.tool : tool // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
