// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'report_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ReportStateTearOff {
  const _$ReportStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Loading loading() {
    return const Loading();
  }

  SendReportSuccess sendReportSuccess({required String msg}) {
    return SendReportSuccess(
      msg: msg,
    );
  }

  DeleteReportSuccess deleteReportSuccess({required String msg}) {
    return DeleteReportSuccess(
      msg: msg,
    );
  }

  RoadReportLoaded roadReportLoaded({required List<RoadReportDataModel> data}) {
    return RoadReportLoaded(
      data: data,
    );
  }

  BridgeReportLoaded bridgeReportLoaded(
      {required List<BridgeReportDataModel> data}) {
    return BridgeReportLoaded(
      data: data,
    );
  }

  Failure failure({required String msg}) {
    return Failure(
      msg: msg,
    );
  }
}

/// @nodoc
const $ReportState = _$ReportStateTearOff();

/// @nodoc
mixin _$ReportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String msg) sendReportSuccess,
    required TResult Function(String msg) deleteReportSuccess,
    required TResult Function(List<RoadReportDataModel> data) roadReportLoaded,
    required TResult Function(List<BridgeReportDataModel> data)
        bridgeReportLoaded,
    required TResult Function(String msg) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String msg)? sendReportSuccess,
    TResult Function(String msg)? deleteReportSuccess,
    TResult Function(List<RoadReportDataModel> data)? roadReportLoaded,
    TResult Function(List<BridgeReportDataModel> data)? bridgeReportLoaded,
    TResult Function(String msg)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SendReportSuccess value) sendReportSuccess,
    required TResult Function(DeleteReportSuccess value) deleteReportSuccess,
    required TResult Function(RoadReportLoaded value) roadReportLoaded,
    required TResult Function(BridgeReportLoaded value) bridgeReportLoaded,
    required TResult Function(Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SendReportSuccess value)? sendReportSuccess,
    TResult Function(DeleteReportSuccess value)? deleteReportSuccess,
    TResult Function(RoadReportLoaded value)? roadReportLoaded,
    TResult Function(BridgeReportLoaded value)? bridgeReportLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportStateCopyWith<$Res> {
  factory $ReportStateCopyWith(
          ReportState value, $Res Function(ReportState) then) =
      _$ReportStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ReportStateCopyWithImpl<$Res> implements $ReportStateCopyWith<$Res> {
  _$ReportStateCopyWithImpl(this._value, this._then);

  final ReportState _value;
  // ignore: unused_field
  final $Res Function(ReportState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$ReportStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'ReportState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String msg) sendReportSuccess,
    required TResult Function(String msg) deleteReportSuccess,
    required TResult Function(List<RoadReportDataModel> data) roadReportLoaded,
    required TResult Function(List<BridgeReportDataModel> data)
        bridgeReportLoaded,
    required TResult Function(String msg) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String msg)? sendReportSuccess,
    TResult Function(String msg)? deleteReportSuccess,
    TResult Function(List<RoadReportDataModel> data)? roadReportLoaded,
    TResult Function(List<BridgeReportDataModel> data)? bridgeReportLoaded,
    TResult Function(String msg)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SendReportSuccess value) sendReportSuccess,
    required TResult Function(DeleteReportSuccess value) deleteReportSuccess,
    required TResult Function(RoadReportLoaded value) roadReportLoaded,
    required TResult Function(BridgeReportLoaded value) bridgeReportLoaded,
    required TResult Function(Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SendReportSuccess value)? sendReportSuccess,
    TResult Function(DeleteReportSuccess value)? deleteReportSuccess,
    TResult Function(RoadReportLoaded value)? roadReportLoaded,
    TResult Function(BridgeReportLoaded value)? bridgeReportLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ReportState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$ReportStateCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc

class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'ReportState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String msg) sendReportSuccess,
    required TResult Function(String msg) deleteReportSuccess,
    required TResult Function(List<RoadReportDataModel> data) roadReportLoaded,
    required TResult Function(List<BridgeReportDataModel> data)
        bridgeReportLoaded,
    required TResult Function(String msg) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String msg)? sendReportSuccess,
    TResult Function(String msg)? deleteReportSuccess,
    TResult Function(List<RoadReportDataModel> data)? roadReportLoaded,
    TResult Function(List<BridgeReportDataModel> data)? bridgeReportLoaded,
    TResult Function(String msg)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SendReportSuccess value) sendReportSuccess,
    required TResult Function(DeleteReportSuccess value) deleteReportSuccess,
    required TResult Function(RoadReportLoaded value) roadReportLoaded,
    required TResult Function(BridgeReportLoaded value) bridgeReportLoaded,
    required TResult Function(Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SendReportSuccess value)? sendReportSuccess,
    TResult Function(DeleteReportSuccess value)? deleteReportSuccess,
    TResult Function(RoadReportLoaded value)? roadReportLoaded,
    TResult Function(BridgeReportLoaded value)? bridgeReportLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements ReportState {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $SendReportSuccessCopyWith<$Res> {
  factory $SendReportSuccessCopyWith(
          SendReportSuccess value, $Res Function(SendReportSuccess) then) =
      _$SendReportSuccessCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class _$SendReportSuccessCopyWithImpl<$Res>
    extends _$ReportStateCopyWithImpl<$Res>
    implements $SendReportSuccessCopyWith<$Res> {
  _$SendReportSuccessCopyWithImpl(
      SendReportSuccess _value, $Res Function(SendReportSuccess) _then)
      : super(_value, (v) => _then(v as SendReportSuccess));

  @override
  SendReportSuccess get _value => super._value as SendReportSuccess;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(SendReportSuccess(
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendReportSuccess implements SendReportSuccess {
  const _$SendReportSuccess({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'ReportState.sendReportSuccess(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SendReportSuccess &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(msg);

  @JsonKey(ignore: true)
  @override
  $SendReportSuccessCopyWith<SendReportSuccess> get copyWith =>
      _$SendReportSuccessCopyWithImpl<SendReportSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String msg) sendReportSuccess,
    required TResult Function(String msg) deleteReportSuccess,
    required TResult Function(List<RoadReportDataModel> data) roadReportLoaded,
    required TResult Function(List<BridgeReportDataModel> data)
        bridgeReportLoaded,
    required TResult Function(String msg) failure,
  }) {
    return sendReportSuccess(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String msg)? sendReportSuccess,
    TResult Function(String msg)? deleteReportSuccess,
    TResult Function(List<RoadReportDataModel> data)? roadReportLoaded,
    TResult Function(List<BridgeReportDataModel> data)? bridgeReportLoaded,
    TResult Function(String msg)? failure,
    required TResult orElse(),
  }) {
    if (sendReportSuccess != null) {
      return sendReportSuccess(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SendReportSuccess value) sendReportSuccess,
    required TResult Function(DeleteReportSuccess value) deleteReportSuccess,
    required TResult Function(RoadReportLoaded value) roadReportLoaded,
    required TResult Function(BridgeReportLoaded value) bridgeReportLoaded,
    required TResult Function(Failure value) failure,
  }) {
    return sendReportSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SendReportSuccess value)? sendReportSuccess,
    TResult Function(DeleteReportSuccess value)? deleteReportSuccess,
    TResult Function(RoadReportLoaded value)? roadReportLoaded,
    TResult Function(BridgeReportLoaded value)? bridgeReportLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (sendReportSuccess != null) {
      return sendReportSuccess(this);
    }
    return orElse();
  }
}

abstract class SendReportSuccess implements ReportState {
  const factory SendReportSuccess({required String msg}) = _$SendReportSuccess;

  String get msg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SendReportSuccessCopyWith<SendReportSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteReportSuccessCopyWith<$Res> {
  factory $DeleteReportSuccessCopyWith(
          DeleteReportSuccess value, $Res Function(DeleteReportSuccess) then) =
      _$DeleteReportSuccessCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class _$DeleteReportSuccessCopyWithImpl<$Res>
    extends _$ReportStateCopyWithImpl<$Res>
    implements $DeleteReportSuccessCopyWith<$Res> {
  _$DeleteReportSuccessCopyWithImpl(
      DeleteReportSuccess _value, $Res Function(DeleteReportSuccess) _then)
      : super(_value, (v) => _then(v as DeleteReportSuccess));

  @override
  DeleteReportSuccess get _value => super._value as DeleteReportSuccess;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(DeleteReportSuccess(
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteReportSuccess implements DeleteReportSuccess {
  const _$DeleteReportSuccess({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'ReportState.deleteReportSuccess(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteReportSuccess &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(msg);

  @JsonKey(ignore: true)
  @override
  $DeleteReportSuccessCopyWith<DeleteReportSuccess> get copyWith =>
      _$DeleteReportSuccessCopyWithImpl<DeleteReportSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String msg) sendReportSuccess,
    required TResult Function(String msg) deleteReportSuccess,
    required TResult Function(List<RoadReportDataModel> data) roadReportLoaded,
    required TResult Function(List<BridgeReportDataModel> data)
        bridgeReportLoaded,
    required TResult Function(String msg) failure,
  }) {
    return deleteReportSuccess(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String msg)? sendReportSuccess,
    TResult Function(String msg)? deleteReportSuccess,
    TResult Function(List<RoadReportDataModel> data)? roadReportLoaded,
    TResult Function(List<BridgeReportDataModel> data)? bridgeReportLoaded,
    TResult Function(String msg)? failure,
    required TResult orElse(),
  }) {
    if (deleteReportSuccess != null) {
      return deleteReportSuccess(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SendReportSuccess value) sendReportSuccess,
    required TResult Function(DeleteReportSuccess value) deleteReportSuccess,
    required TResult Function(RoadReportLoaded value) roadReportLoaded,
    required TResult Function(BridgeReportLoaded value) bridgeReportLoaded,
    required TResult Function(Failure value) failure,
  }) {
    return deleteReportSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SendReportSuccess value)? sendReportSuccess,
    TResult Function(DeleteReportSuccess value)? deleteReportSuccess,
    TResult Function(RoadReportLoaded value)? roadReportLoaded,
    TResult Function(BridgeReportLoaded value)? bridgeReportLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (deleteReportSuccess != null) {
      return deleteReportSuccess(this);
    }
    return orElse();
  }
}

abstract class DeleteReportSuccess implements ReportState {
  const factory DeleteReportSuccess({required String msg}) =
      _$DeleteReportSuccess;

  String get msg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteReportSuccessCopyWith<DeleteReportSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RoadReportLoadedCopyWith<$Res> {
  factory $RoadReportLoadedCopyWith(
          RoadReportLoaded value, $Res Function(RoadReportLoaded) then) =
      _$RoadReportLoadedCopyWithImpl<$Res>;
  $Res call({List<RoadReportDataModel> data});
}

/// @nodoc
class _$RoadReportLoadedCopyWithImpl<$Res>
    extends _$ReportStateCopyWithImpl<$Res>
    implements $RoadReportLoadedCopyWith<$Res> {
  _$RoadReportLoadedCopyWithImpl(
      RoadReportLoaded _value, $Res Function(RoadReportLoaded) _then)
      : super(_value, (v) => _then(v as RoadReportLoaded));

  @override
  RoadReportLoaded get _value => super._value as RoadReportLoaded;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(RoadReportLoaded(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<RoadReportDataModel>,
    ));
  }
}

/// @nodoc

class _$RoadReportLoaded implements RoadReportLoaded {
  const _$RoadReportLoaded({required this.data});

  @override
  final List<RoadReportDataModel> data;

  @override
  String toString() {
    return 'ReportState.roadReportLoaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RoadReportLoaded &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $RoadReportLoadedCopyWith<RoadReportLoaded> get copyWith =>
      _$RoadReportLoadedCopyWithImpl<RoadReportLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String msg) sendReportSuccess,
    required TResult Function(String msg) deleteReportSuccess,
    required TResult Function(List<RoadReportDataModel> data) roadReportLoaded,
    required TResult Function(List<BridgeReportDataModel> data)
        bridgeReportLoaded,
    required TResult Function(String msg) failure,
  }) {
    return roadReportLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String msg)? sendReportSuccess,
    TResult Function(String msg)? deleteReportSuccess,
    TResult Function(List<RoadReportDataModel> data)? roadReportLoaded,
    TResult Function(List<BridgeReportDataModel> data)? bridgeReportLoaded,
    TResult Function(String msg)? failure,
    required TResult orElse(),
  }) {
    if (roadReportLoaded != null) {
      return roadReportLoaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SendReportSuccess value) sendReportSuccess,
    required TResult Function(DeleteReportSuccess value) deleteReportSuccess,
    required TResult Function(RoadReportLoaded value) roadReportLoaded,
    required TResult Function(BridgeReportLoaded value) bridgeReportLoaded,
    required TResult Function(Failure value) failure,
  }) {
    return roadReportLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SendReportSuccess value)? sendReportSuccess,
    TResult Function(DeleteReportSuccess value)? deleteReportSuccess,
    TResult Function(RoadReportLoaded value)? roadReportLoaded,
    TResult Function(BridgeReportLoaded value)? bridgeReportLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (roadReportLoaded != null) {
      return roadReportLoaded(this);
    }
    return orElse();
  }
}

abstract class RoadReportLoaded implements ReportState {
  const factory RoadReportLoaded({required List<RoadReportDataModel> data}) =
      _$RoadReportLoaded;

  List<RoadReportDataModel> get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RoadReportLoadedCopyWith<RoadReportLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BridgeReportLoadedCopyWith<$Res> {
  factory $BridgeReportLoadedCopyWith(
          BridgeReportLoaded value, $Res Function(BridgeReportLoaded) then) =
      _$BridgeReportLoadedCopyWithImpl<$Res>;
  $Res call({List<BridgeReportDataModel> data});
}

/// @nodoc
class _$BridgeReportLoadedCopyWithImpl<$Res>
    extends _$ReportStateCopyWithImpl<$Res>
    implements $BridgeReportLoadedCopyWith<$Res> {
  _$BridgeReportLoadedCopyWithImpl(
      BridgeReportLoaded _value, $Res Function(BridgeReportLoaded) _then)
      : super(_value, (v) => _then(v as BridgeReportLoaded));

  @override
  BridgeReportLoaded get _value => super._value as BridgeReportLoaded;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(BridgeReportLoaded(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BridgeReportDataModel>,
    ));
  }
}

/// @nodoc

class _$BridgeReportLoaded implements BridgeReportLoaded {
  const _$BridgeReportLoaded({required this.data});

  @override
  final List<BridgeReportDataModel> data;

  @override
  String toString() {
    return 'ReportState.bridgeReportLoaded(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is BridgeReportLoaded &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  $BridgeReportLoadedCopyWith<BridgeReportLoaded> get copyWith =>
      _$BridgeReportLoadedCopyWithImpl<BridgeReportLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String msg) sendReportSuccess,
    required TResult Function(String msg) deleteReportSuccess,
    required TResult Function(List<RoadReportDataModel> data) roadReportLoaded,
    required TResult Function(List<BridgeReportDataModel> data)
        bridgeReportLoaded,
    required TResult Function(String msg) failure,
  }) {
    return bridgeReportLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String msg)? sendReportSuccess,
    TResult Function(String msg)? deleteReportSuccess,
    TResult Function(List<RoadReportDataModel> data)? roadReportLoaded,
    TResult Function(List<BridgeReportDataModel> data)? bridgeReportLoaded,
    TResult Function(String msg)? failure,
    required TResult orElse(),
  }) {
    if (bridgeReportLoaded != null) {
      return bridgeReportLoaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SendReportSuccess value) sendReportSuccess,
    required TResult Function(DeleteReportSuccess value) deleteReportSuccess,
    required TResult Function(RoadReportLoaded value) roadReportLoaded,
    required TResult Function(BridgeReportLoaded value) bridgeReportLoaded,
    required TResult Function(Failure value) failure,
  }) {
    return bridgeReportLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SendReportSuccess value)? sendReportSuccess,
    TResult Function(DeleteReportSuccess value)? deleteReportSuccess,
    TResult Function(RoadReportLoaded value)? roadReportLoaded,
    TResult Function(BridgeReportLoaded value)? bridgeReportLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (bridgeReportLoaded != null) {
      return bridgeReportLoaded(this);
    }
    return orElse();
  }
}

abstract class BridgeReportLoaded implements ReportState {
  const factory BridgeReportLoaded(
      {required List<BridgeReportDataModel> data}) = _$BridgeReportLoaded;

  List<BridgeReportDataModel> get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BridgeReportLoadedCopyWith<BridgeReportLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({String msg});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> extends _$ReportStateCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(Failure _value, $Res Function(Failure) _then)
      : super(_value, (v) => _then(v as Failure));

  @override
  Failure get _value => super._value as Failure;

  @override
  $Res call({
    Object? msg = freezed,
  }) {
    return _then(Failure(
      msg: msg == freezed
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Failure implements Failure {
  const _$Failure({required this.msg});

  @override
  final String msg;

  @override
  String toString() {
    return 'ReportState.failure(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failure &&
            (identical(other.msg, msg) ||
                const DeepCollectionEquality().equals(other.msg, msg)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(msg);

  @JsonKey(ignore: true)
  @override
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String msg) sendReportSuccess,
    required TResult Function(String msg) deleteReportSuccess,
    required TResult Function(List<RoadReportDataModel> data) roadReportLoaded,
    required TResult Function(List<BridgeReportDataModel> data)
        bridgeReportLoaded,
    required TResult Function(String msg) failure,
  }) {
    return failure(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String msg)? sendReportSuccess,
    TResult Function(String msg)? deleteReportSuccess,
    TResult Function(List<RoadReportDataModel> data)? roadReportLoaded,
    TResult Function(List<BridgeReportDataModel> data)? bridgeReportLoaded,
    TResult Function(String msg)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(SendReportSuccess value) sendReportSuccess,
    required TResult Function(DeleteReportSuccess value) deleteReportSuccess,
    required TResult Function(RoadReportLoaded value) roadReportLoaded,
    required TResult Function(BridgeReportLoaded value) bridgeReportLoaded,
    required TResult Function(Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(SendReportSuccess value)? sendReportSuccess,
    TResult Function(DeleteReportSuccess value)? deleteReportSuccess,
    TResult Function(RoadReportLoaded value)? roadReportLoaded,
    TResult Function(BridgeReportLoaded value)? bridgeReportLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements ReportState {
  const factory Failure({required String msg}) = _$Failure;

  String get msg => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}
