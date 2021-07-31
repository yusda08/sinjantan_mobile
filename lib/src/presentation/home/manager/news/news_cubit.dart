import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/error/exception_mapper.dart';
import 'package:sijantan/src/data/models/home/news_model.dart';
import 'package:sijantan/src/domain/use_cases/home/get_news.dart';

part 'news_cubit.freezed.dart';

part 'news_state.dart';

@injectable
class NewsCubit extends Cubit<NewsState> {
  final GetNews _getNews;

  NewsCubit(
    GetNews getNews,
  )   : _getNews = getNews,
        super(const Initial());

  getNews() async {
    emit(Loading());
    final getNews = await _getNews();
    getNews.fold(
      (l) => emit(Failure(msg: ExceptionMapper.call(l))),
      (r) => emit(NewsLoaded(data: r.result)),
    );
  }
}
