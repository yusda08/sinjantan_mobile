part of 'news_cubit.dart';

@freezed
abstract class NewsState implements _$NewsState {
  const factory NewsState.initial() = Initial;

  const factory NewsState.loading() = Loading;

  const factory NewsState.failure({required String msg}) = Failure;

  const factory NewsState.newsLoaded({required List<NewsModel> data}) =
      NewsLoaded;
}
