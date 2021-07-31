import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class UseCase<RightType, Params> {
  Future<Either<Exception, RightType>> call(Params params);
}

// class NoParams extends Equatable {
//   @override
//   List<Object> get props => [];
// }
//
// class SearchParams extends Equatable {
//   final String keyword;
//   final int page;
//
//   SearchParams({required this.keyword, required this.page});
//
//   @override
//   List<Object> get props => [keyword, page];
// }
