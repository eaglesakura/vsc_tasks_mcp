// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_definition_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskDefinitionDto {

@JsonKey(name: "label") String get label;@JsonKey(name: "command") String get command;@JsonKey(name: "args") List<String>? get args;@JsonKey(name: "options") Map<String, dynamic>? get options;
/// Create a copy of TaskDefinitionDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDefinitionDtoCopyWith<TaskDefinitionDto> get copyWith => _$TaskDefinitionDtoCopyWithImpl<TaskDefinitionDto>(this as TaskDefinitionDto, _$identity);

  /// Serializes this TaskDefinitionDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDefinitionDto&&(identical(other.label, label) || other.label == label)&&(identical(other.command, command) || other.command == command)&&const DeepCollectionEquality().equals(other.args, args)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,command,const DeepCollectionEquality().hash(args),const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'TaskDefinitionDto(label: $label, command: $command, args: $args, options: $options)';
}


}

/// @nodoc
abstract mixin class $TaskDefinitionDtoCopyWith<$Res>  {
  factory $TaskDefinitionDtoCopyWith(TaskDefinitionDto value, $Res Function(TaskDefinitionDto) _then) = _$TaskDefinitionDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "label") String label,@JsonKey(name: "command") String command,@JsonKey(name: "args") List<String>? args,@JsonKey(name: "options") Map<String, dynamic>? options
});




}
/// @nodoc
class _$TaskDefinitionDtoCopyWithImpl<$Res>
    implements $TaskDefinitionDtoCopyWith<$Res> {
  _$TaskDefinitionDtoCopyWithImpl(this._self, this._then);

  final TaskDefinitionDto _self;
  final $Res Function(TaskDefinitionDto) _then;

/// Create a copy of TaskDefinitionDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? label = null,Object? command = null,Object? args = freezed,Object? options = freezed,}) {
  return _then(_self.copyWith(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,args: freezed == args ? _self.args : args // ignore: cast_nullable_to_non_nullable
as List<String>?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskDefinitionDto].
extension TaskDefinitionDtoPatterns on TaskDefinitionDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskDefinitionDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskDefinitionDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskDefinitionDto value)  $default,){
final _that = this;
switch (_that) {
case _TaskDefinitionDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskDefinitionDto value)?  $default,){
final _that = this;
switch (_that) {
case _TaskDefinitionDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "label")  String label, @JsonKey(name: "command")  String command, @JsonKey(name: "args")  List<String>? args, @JsonKey(name: "options")  Map<String, dynamic>? options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskDefinitionDto() when $default != null:
return $default(_that.label,_that.command,_that.args,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "label")  String label, @JsonKey(name: "command")  String command, @JsonKey(name: "args")  List<String>? args, @JsonKey(name: "options")  Map<String, dynamic>? options)  $default,) {final _that = this;
switch (_that) {
case _TaskDefinitionDto():
return $default(_that.label,_that.command,_that.args,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "label")  String label, @JsonKey(name: "command")  String command, @JsonKey(name: "args")  List<String>? args, @JsonKey(name: "options")  Map<String, dynamic>? options)?  $default,) {final _that = this;
switch (_that) {
case _TaskDefinitionDto() when $default != null:
return $default(_that.label,_that.command,_that.args,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskDefinitionDto extends TaskDefinitionDto {
  const _TaskDefinitionDto({@JsonKey(name: "label") required this.label, @JsonKey(name: "command") required this.command, @JsonKey(name: "args") final  List<String>? args, @JsonKey(name: "options") final  Map<String, dynamic>? options}): _args = args,_options = options,super._();
  factory _TaskDefinitionDto.fromJson(Map<String, dynamic> json) => _$TaskDefinitionDtoFromJson(json);

@override@JsonKey(name: "label") final  String label;
@override@JsonKey(name: "command") final  String command;
 final  List<String>? _args;
@override@JsonKey(name: "args") List<String>? get args {
  final value = _args;
  if (value == null) return null;
  if (_args is EqualUnmodifiableListView) return _args;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _options;
@override@JsonKey(name: "options") Map<String, dynamic>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableMapView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of TaskDefinitionDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskDefinitionDtoCopyWith<_TaskDefinitionDto> get copyWith => __$TaskDefinitionDtoCopyWithImpl<_TaskDefinitionDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskDefinitionDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskDefinitionDto&&(identical(other.label, label) || other.label == label)&&(identical(other.command, command) || other.command == command)&&const DeepCollectionEquality().equals(other._args, _args)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,label,command,const DeepCollectionEquality().hash(_args),const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'TaskDefinitionDto(label: $label, command: $command, args: $args, options: $options)';
}


}

/// @nodoc
abstract mixin class _$TaskDefinitionDtoCopyWith<$Res> implements $TaskDefinitionDtoCopyWith<$Res> {
  factory _$TaskDefinitionDtoCopyWith(_TaskDefinitionDto value, $Res Function(_TaskDefinitionDto) _then) = __$TaskDefinitionDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "label") String label,@JsonKey(name: "command") String command,@JsonKey(name: "args") List<String>? args,@JsonKey(name: "options") Map<String, dynamic>? options
});




}
/// @nodoc
class __$TaskDefinitionDtoCopyWithImpl<$Res>
    implements _$TaskDefinitionDtoCopyWith<$Res> {
  __$TaskDefinitionDtoCopyWithImpl(this._self, this._then);

  final _TaskDefinitionDto _self;
  final $Res Function(_TaskDefinitionDto) _then;

/// Create a copy of TaskDefinitionDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? label = null,Object? command = null,Object? args = freezed,Object? options = freezed,}) {
  return _then(_TaskDefinitionDto(
label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,command: null == command ? _self.command : command // ignore: cast_nullable_to_non_nullable
as String,args: freezed == args ? _self._args : args // ignore: cast_nullable_to_non_nullable
as List<String>?,options: freezed == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
