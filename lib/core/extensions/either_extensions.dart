import 'package:dartz/dartz.dart';

extension EitherExtension<L, R> on Either<L, R> {
  L? leftOrNull() => fold((left) => left, (_) => null);
  R? rightOrNull() => fold((_) => null, (right) => right);

  L? left({L? defaultValue}) => fold((left) => left, (_) => defaultValue);
  R? right({R? defaultValue}) => fold((_) => defaultValue, (right) => right);
}
