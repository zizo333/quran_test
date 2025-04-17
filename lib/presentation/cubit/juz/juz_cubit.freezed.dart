// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'juz_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$JuzState {

 List<AppModel> get juzList; List<AppModel> get selectedJuzList;
/// Create a copy of JuzState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JuzStateCopyWith<JuzState> get copyWith => _$JuzStateCopyWithImpl<JuzState>(this as JuzState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JuzState&&const DeepCollectionEquality().equals(other.juzList, juzList)&&const DeepCollectionEquality().equals(other.selectedJuzList, selectedJuzList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(juzList),const DeepCollectionEquality().hash(selectedJuzList));

@override
String toString() {
  return 'JuzState(juzList: $juzList, selectedJuzList: $selectedJuzList)';
}


}

/// @nodoc
abstract mixin class $JuzStateCopyWith<$Res>  {
  factory $JuzStateCopyWith(JuzState value, $Res Function(JuzState) _then) = _$JuzStateCopyWithImpl;
@useResult
$Res call({
 List<AppModel> juzList, List<AppModel> selectedJuzList
});




}
/// @nodoc
class _$JuzStateCopyWithImpl<$Res>
    implements $JuzStateCopyWith<$Res> {
  _$JuzStateCopyWithImpl(this._self, this._then);

  final JuzState _self;
  final $Res Function(JuzState) _then;

/// Create a copy of JuzState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? juzList = null,Object? selectedJuzList = null,}) {
  return _then(_self.copyWith(
juzList: null == juzList ? _self.juzList : juzList // ignore: cast_nullable_to_non_nullable
as List<AppModel>,selectedJuzList: null == selectedJuzList ? _self.selectedJuzList : selectedJuzList // ignore: cast_nullable_to_non_nullable
as List<AppModel>,
  ));
}

}


/// @nodoc


class _JuzState implements JuzState {
  const _JuzState({final  List<AppModel> juzList = const [], final  List<AppModel> selectedJuzList = const []}): _juzList = juzList,_selectedJuzList = selectedJuzList;
  

 final  List<AppModel> _juzList;
@override@JsonKey() List<AppModel> get juzList {
  if (_juzList is EqualUnmodifiableListView) return _juzList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_juzList);
}

 final  List<AppModel> _selectedJuzList;
@override@JsonKey() List<AppModel> get selectedJuzList {
  if (_selectedJuzList is EqualUnmodifiableListView) return _selectedJuzList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedJuzList);
}


/// Create a copy of JuzState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JuzStateCopyWith<_JuzState> get copyWith => __$JuzStateCopyWithImpl<_JuzState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _JuzState&&const DeepCollectionEquality().equals(other._juzList, _juzList)&&const DeepCollectionEquality().equals(other._selectedJuzList, _selectedJuzList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_juzList),const DeepCollectionEquality().hash(_selectedJuzList));

@override
String toString() {
  return 'JuzState(juzList: $juzList, selectedJuzList: $selectedJuzList)';
}


}

/// @nodoc
abstract mixin class _$JuzStateCopyWith<$Res> implements $JuzStateCopyWith<$Res> {
  factory _$JuzStateCopyWith(_JuzState value, $Res Function(_JuzState) _then) = __$JuzStateCopyWithImpl;
@override @useResult
$Res call({
 List<AppModel> juzList, List<AppModel> selectedJuzList
});




}
/// @nodoc
class __$JuzStateCopyWithImpl<$Res>
    implements _$JuzStateCopyWith<$Res> {
  __$JuzStateCopyWithImpl(this._self, this._then);

  final _JuzState _self;
  final $Res Function(_JuzState) _then;

/// Create a copy of JuzState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? juzList = null,Object? selectedJuzList = null,}) {
  return _then(_JuzState(
juzList: null == juzList ? _self._juzList : juzList // ignore: cast_nullable_to_non_nullable
as List<AppModel>,selectedJuzList: null == selectedJuzList ? _self._selectedJuzList : selectedJuzList // ignore: cast_nullable_to_non_nullable
as List<AppModel>,
  ));
}


}

// dart format on
