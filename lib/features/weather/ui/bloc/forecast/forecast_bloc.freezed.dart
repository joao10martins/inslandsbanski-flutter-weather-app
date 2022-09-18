// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'forecast_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForecastState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)
        forecast,
    required TResult Function(Failure failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)?
        forecast,
    TResult Function(Failure failure)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)?
        forecast,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ForecastInfo value) forecast,
    required TResult Function(_Failed value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ForecastInfo value)? forecast,
    TResult Function(_Failed value)? failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ForecastInfo value)? forecast,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastStateCopyWith<$Res> {
  factory $ForecastStateCopyWith(
          ForecastState value, $Res Function(ForecastState) then) =
      _$ForecastStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ForecastStateCopyWithImpl<$Res>
    implements $ForecastStateCopyWith<$Res> {
  _$ForecastStateCopyWithImpl(this._value, this._then);

  final ForecastState _value;
  // ignore: unused_field
  final $Res Function(ForecastState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res> extends _$ForecastStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ForecastState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)
        forecast,
    required TResult Function(Failure failure) failed,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)?
        forecast,
    TResult Function(Failure failure)? failed,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)?
        forecast,
    TResult Function(Failure failure)? failed,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ForecastInfo value) forecast,
    required TResult Function(_Failed value) failed,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ForecastInfo value)? forecast,
    TResult Function(_Failed value)? failed,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ForecastInfo value)? forecast,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ForecastState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res> extends _$ForecastStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'ForecastState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)
        forecast,
    required TResult Function(Failure failure) failed,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)?
        forecast,
    TResult Function(Failure failure)? failed,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)?
        forecast,
    TResult Function(Failure failure)? failed,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ForecastInfo value) forecast,
    required TResult Function(_Failed value) failed,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ForecastInfo value)? forecast,
    TResult Function(_Failed value)? failed,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ForecastInfo value)? forecast,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ForecastState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_ForecastInfoCopyWith<$Res> {
  factory _$$_ForecastInfoCopyWith(
          _$_ForecastInfo value, $Res Function(_$_ForecastInfo) then) =
      __$$_ForecastInfoCopyWithImpl<$Res>;
  $Res call(
      {List<HourWeatherInfo> hoursForecast, List<DailyForecast>? daysForecast});
}

/// @nodoc
class __$$_ForecastInfoCopyWithImpl<$Res>
    extends _$ForecastStateCopyWithImpl<$Res>
    implements _$$_ForecastInfoCopyWith<$Res> {
  __$$_ForecastInfoCopyWithImpl(
      _$_ForecastInfo _value, $Res Function(_$_ForecastInfo) _then)
      : super(_value, (v) => _then(v as _$_ForecastInfo));

  @override
  _$_ForecastInfo get _value => super._value as _$_ForecastInfo;

  @override
  $Res call({
    Object? hoursForecast = freezed,
    Object? daysForecast = freezed,
  }) {
    return _then(_$_ForecastInfo(
      hoursForecast == freezed
          ? _value._hoursForecast
          : hoursForecast // ignore: cast_nullable_to_non_nullable
              as List<HourWeatherInfo>,
      daysForecast == freezed
          ? _value._daysForecast
          : daysForecast // ignore: cast_nullable_to_non_nullable
              as List<DailyForecast>?,
    ));
  }
}

/// @nodoc

class _$_ForecastInfo implements _ForecastInfo {
  const _$_ForecastInfo(final List<HourWeatherInfo> hoursForecast,
      final List<DailyForecast>? daysForecast)
      : _hoursForecast = hoursForecast,
        _daysForecast = daysForecast;

  final List<HourWeatherInfo> _hoursForecast;
  @override
  List<HourWeatherInfo> get hoursForecast {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_hoursForecast);
  }

  final List<DailyForecast>? _daysForecast;
  @override
  List<DailyForecast>? get daysForecast {
    final value = _daysForecast;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ForecastState.forecast(hoursForecast: $hoursForecast, daysForecast: $daysForecast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForecastInfo &&
            const DeepCollectionEquality()
                .equals(other._hoursForecast, _hoursForecast) &&
            const DeepCollectionEquality()
                .equals(other._daysForecast, _daysForecast));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_hoursForecast),
      const DeepCollectionEquality().hash(_daysForecast));

  @JsonKey(ignore: true)
  @override
  _$$_ForecastInfoCopyWith<_$_ForecastInfo> get copyWith =>
      __$$_ForecastInfoCopyWithImpl<_$_ForecastInfo>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)
        forecast,
    required TResult Function(Failure failure) failed,
  }) {
    return forecast(hoursForecast, daysForecast);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)?
        forecast,
    TResult Function(Failure failure)? failed,
  }) {
    return forecast?.call(hoursForecast, daysForecast);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)?
        forecast,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (forecast != null) {
      return forecast(hoursForecast, daysForecast);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ForecastInfo value) forecast,
    required TResult Function(_Failed value) failed,
  }) {
    return forecast(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ForecastInfo value)? forecast,
    TResult Function(_Failed value)? failed,
  }) {
    return forecast?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ForecastInfo value)? forecast,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (forecast != null) {
      return forecast(this);
    }
    return orElse();
  }
}

abstract class _ForecastInfo implements ForecastState {
  const factory _ForecastInfo(final List<HourWeatherInfo> hoursForecast,
      final List<DailyForecast>? daysForecast) = _$_ForecastInfo;

  List<HourWeatherInfo> get hoursForecast;
  List<DailyForecast>? get daysForecast;
  @JsonKey(ignore: true)
  _$$_ForecastInfoCopyWith<_$_ForecastInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FailedCopyWith<$Res> {
  factory _$$_FailedCopyWith(_$_Failed value, $Res Function(_$_Failed) then) =
      __$$_FailedCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class __$$_FailedCopyWithImpl<$Res> extends _$ForecastStateCopyWithImpl<$Res>
    implements _$$_FailedCopyWith<$Res> {
  __$$_FailedCopyWithImpl(_$_Failed _value, $Res Function(_$_Failed) _then)
      : super(_value, (v) => _then(v as _$_Failed));

  @override
  _$_Failed get _value => super._value as _$_Failed;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(_$_Failed(
      failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as Failure,
    ));
  }
}

/// @nodoc

class _$_Failed implements _Failed {
  const _$_Failed(this.failure);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'ForecastState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Failed &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  _$$_FailedCopyWith<_$_Failed> get copyWith =>
      __$$_FailedCopyWithImpl<_$_Failed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)
        forecast,
    required TResult Function(Failure failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)?
        forecast,
    TResult Function(Failure failure)? failed,
  }) {
    return failed?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<HourWeatherInfo> hoursForecast,
            List<DailyForecast>? daysForecast)?
        forecast,
    TResult Function(Failure failure)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_ForecastInfo value) forecast,
    required TResult Function(_Failed value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ForecastInfo value)? forecast,
    TResult Function(_Failed value)? failed,
  }) {
    return failed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_ForecastInfo value)? forecast,
    TResult Function(_Failed value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class _Failed implements ForecastState {
  const factory _Failed(final Failure failure) = _$_Failed;

  Failure get failure;
  @JsonKey(ignore: true)
  _$$_FailedCopyWith<_$_Failed> get copyWith =>
      throw _privateConstructorUsedError;
}
