// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeState {

 List<AppModel> get surahList; List<AppModel> get juzList;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.surahList, surahList)&&const DeepCollectionEquality().equals(other.juzList, juzList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(surahList),const DeepCollectionEquality().hash(juzList));

@override
String toString() {
  return 'HomeState(surahList: $surahList, juzList: $juzList)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 List<AppModel> surahList, List<AppModel> juzList
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? surahList = null,Object? juzList = null,}) {
  return _then(_self.copyWith(
surahList: null == surahList ? _self.surahList : surahList // ignore: cast_nullable_to_non_nullable
as List<AppModel>,juzList: null == juzList ? _self.juzList : juzList // ignore: cast_nullable_to_non_nullable
as List<AppModel>,
  ));
}

}


/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({final  List<AppModel> surahList = const [], final  List<AppModel> juzList = const []}): _surahList = surahList,_juzList = juzList;
  

 final  List<AppModel> _surahList;
@override@JsonKey() List<AppModel> get surahList {
  if (_surahList is EqualUnmodifiableListView) return _surahList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_surahList);
}

 final  List<AppModel> _juzList;
@override@JsonKey() List<AppModel> get juzList {
  if (_juzList is EqualUnmodifiableListView) return _juzList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_juzList);
}


/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other._surahList, _surahList)&&const DeepCollectionEquality().equals(other._juzList, _juzList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_surahList),const DeepCollectionEquality().hash(_juzList));

@override
String toString() {
  return 'HomeState(surahList: $surahList, juzList: $juzList)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 List<AppModel> surahList, List<AppModel> juzList
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? surahList = null,Object? juzList = null,}) {
  return _then(_HomeState(
surahList: null == surahList ? _self._surahList : surahList // ignore: cast_nullable_to_non_nullable
as List<AppModel>,juzList: null == juzList ? _self._juzList : juzList // ignore: cast_nullable_to_non_nullable
as List<AppModel>,
  ));
}


}

// dart format on
