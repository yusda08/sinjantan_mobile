part of 'running_text_cubit.dart';

@freezed
class RunningTextState with _$RunningTextState {
  const factory RunningTextState.initial() = Initial;

  const factory RunningTextState.loading() = Loading;

  const factory RunningTextState.failure({required String msg}) = Failure;

  const factory RunningTextState.runningTextLoaded({required RunningText data}) =
      RunningTextLoaded;
}
