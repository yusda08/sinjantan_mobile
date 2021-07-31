import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/error/exception_mapper.dart';
import 'package:sijantan/src/data/models/home/banner_model.dart';
import 'package:sijantan/src/domain/use_cases/home/get_banner.dart';

part 'banner_cubit.freezed.dart';
part 'banner_state.dart';

@injectable
class BannerCubit extends Cubit<BannerState> {
  final GetBanner _getBanner;

  BannerCubit(
    GetBanner getBanner,
  )   : _getBanner = getBanner,
        super(const Initial());

  getBanner() async {
    emit(Loading());
    final getBanner = await _getBanner();
    getBanner.fold(
      (l) => emit(Failure(msg: ExceptionMapper.call(l))),
      (r) => emit(BannerLoaded(data: r.result)),
    );
  }
}
