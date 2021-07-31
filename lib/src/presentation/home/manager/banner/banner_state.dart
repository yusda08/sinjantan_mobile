part of 'banner_cubit.dart';

@freezed
class BannerState with _$BannerState {
  const factory BannerState.initial() = Initial;

  const factory BannerState.loading() = Loading;

  const factory BannerState.failure({required String msg}) = Failure;

  const factory BannerState.bannerLoaded({required List<BannerModel> data}) =
      BannerLoaded;
}
