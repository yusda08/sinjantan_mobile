import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:sijantan/core/api/response/home/running_text_resp.dart';
import 'package:sijantan/core/error/exception_mapper.dart';
import 'package:sijantan/src/data/models/home/news_model.dart';
import 'package:sijantan/src/domain/use_cases/home/get_news.dart';
import 'package:sijantan/src/domain/use_cases/home/get_running_text.dart';

part 'running_text_cubit.freezed.dart';

part 'running_text_state.dart';

@injectable
class RunningTextCubit extends Cubit<RunningTextState> {
  final GetRunningText _getRunningText;

  RunningTextCubit(
    GetRunningText getRunningText,
  )   : _getRunningText = getRunningText,
        super(const Initial());

  getRunningText() async {
    emit(Loading());
    final getRunningText = await _getRunningText();
    getRunningText.fold(
      (l) => emit(Failure(msg: ExceptionMapper.call(l))),
      (r) => emit(RunningTextLoaded(data: r.result)),
    );
  }
}
