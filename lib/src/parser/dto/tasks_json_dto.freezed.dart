// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_json_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TasksJsonDto {

@JsonKey(name: "tasks") List<TaskDefinitionDto>? get tasks;@JsonKey(name: "inputs") List<InputDefinitionDto>? get inputs;
/// Create a copy of TasksJsonDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksJsonDtoCopyWith<TasksJsonDto> get copyWith => _$TasksJsonDtoCopyWithImpl<TasksJsonDto>(this as TasksJsonDto, _$identity);

  /// Serializes this TasksJsonDto to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksJsonDto&&const DeepCollectionEquality().equals(other.tasks, tasks)&&const DeepCollectionEquality().equals(other.inputs, inputs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tasks),const DeepCollectionEquality().hash(inputs));

@override
String toString() {
  return 'TasksJsonDto(tasks: $tasks, inputs: $inputs)';
}


}

/// @nodoc
abstract mixin class $TasksJsonDtoCopyWith<$Res>  {
  factory $TasksJsonDtoCopyWith(TasksJsonDto value, $Res Function(TasksJsonDto) _then) = _$TasksJsonDtoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: "tasks") List<TaskDefinitionDto>? tasks,@JsonKey(name: "inputs") List<InputDefinitionDto>? inputs
});




}
/// @nodoc
class _$TasksJsonDtoCopyWithImpl<$Res>
    implements $TasksJsonDtoCopyWith<$Res> {
  _$TasksJsonDtoCopyWithImpl(this._self, this._then);

  final TasksJsonDto _self;
  final $Res Function(TasksJsonDto) _then;

/// Create a copy of TasksJsonDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tasks = freezed,Object? inputs = freezed,}) {
  return _then(_self.copyWith(
tasks: freezed == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskDefinitionDto>?,inputs: freezed == inputs ? _self.inputs : inputs // ignore: cast_nullable_to_non_nullable
as List<InputDefinitionDto>?,
  ));
}

}


/// Adds pattern-matching-related methods to [TasksJsonDto].
extension TasksJsonDtoPatterns on TasksJsonDto {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TasksJsonDto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TasksJsonDto() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TasksJsonDto value)  $default,){
final _that = this;
switch (_that) {
case _TasksJsonDto():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TasksJsonDto value)?  $default,){
final _that = this;
switch (_that) {
case _TasksJsonDto() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: "tasks")  List<TaskDefinitionDto>? tasks, @JsonKey(name: "inputs")  List<InputDefinitionDto>? inputs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TasksJsonDto() when $default != null:
return $default(_that.tasks,_that.inputs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: "tasks")  List<TaskDefinitionDto>? tasks, @JsonKey(name: "inputs")  List<InputDefinitionDto>? inputs)  $default,) {final _that = this;
switch (_that) {
case _TasksJsonDto():
return $default(_that.tasks,_that.inputs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: "tasks")  List<TaskDefinitionDto>? tasks, @JsonKey(name: "inputs")  List<InputDefinitionDto>? inputs)?  $default,) {final _that = this;
switch (_that) {
case _TasksJsonDto() when $default != null:
return $default(_that.tasks,_that.inputs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TasksJsonDto implements TasksJsonDto {
  const _TasksJsonDto({@JsonKey(name: "tasks") final  List<TaskDefinitionDto>? tasks, @JsonKey(name: "inputs") final  List<InputDefinitionDto>? inputs}): _tasks = tasks,_inputs = inputs;
  factory _TasksJsonDto.fromJson(Map<String, dynamic> json) => _$TasksJsonDtoFromJson(json);

 final  List<TaskDefinitionDto>? _tasks;
@override@JsonKey(name: "tasks") List<TaskDefinitionDto>? get tasks {
  final value = _tasks;
  if (value == null) return null;
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<InputDefinitionDto>? _inputs;
@override@JsonKey(name: "inputs") List<InputDefinitionDto>? get inputs {
  final value = _inputs;
  if (value == null) return null;
  if (_inputs is EqualUnmodifiableListView) return _inputs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of TasksJsonDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TasksJsonDtoCopyWith<_TasksJsonDto> get copyWith => __$TasksJsonDtoCopyWithImpl<_TasksJsonDto>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TasksJsonDtoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksJsonDto&&const DeepCollectionEquality().equals(other._tasks, _tasks)&&const DeepCollectionEquality().equals(other._inputs, _inputs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tasks),const DeepCollectionEquality().hash(_inputs));

@override
String toString() {
  return 'TasksJsonDto(tasks: $tasks, inputs: $inputs)';
}


}

/// @nodoc
abstract mixin class _$TasksJsonDtoCopyWith<$Res> implements $TasksJsonDtoCopyWith<$Res> {
  factory _$TasksJsonDtoCopyWith(_TasksJsonDto value, $Res Function(_TasksJsonDto) _then) = __$TasksJsonDtoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: "tasks") List<TaskDefinitionDto>? tasks,@JsonKey(name: "inputs") List<InputDefinitionDto>? inputs
});




}
/// @nodoc
class __$TasksJsonDtoCopyWithImpl<$Res>
    implements _$TasksJsonDtoCopyWith<$Res> {
  __$TasksJsonDtoCopyWithImpl(this._self, this._then);

  final _TasksJsonDto _self;
  final $Res Function(_TasksJsonDto) _then;

/// Create a copy of TasksJsonDto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tasks = freezed,Object? inputs = freezed,}) {
  return _then(_TasksJsonDto(
tasks: freezed == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskDefinitionDto>?,inputs: freezed == inputs ? _self._inputs : inputs // ignore: cast_nullable_to_non_nullable
as List<InputDefinitionDto>?,
  ));
}


}

// dart format on
