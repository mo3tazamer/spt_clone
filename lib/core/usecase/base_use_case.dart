import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../error/failures.dart';

abstract class BaseUseCase<T, Prams> {
  Future<Result<T, Failure>> call(Prams params);
}

class NoParams extends Equatable {
  const NoParams();
  @override
  List<Object> get props => [];
}
