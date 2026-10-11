import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maki_mobile/core/api/api_exception.dart';

part 'submit_state.freezed.dart';

/// Where a form's submission stands.
@freezed
sealed class SubmitState with _$SubmitState {
  const factory SubmitState.idle() = SubmitIdle;
  const factory SubmitState.submitting() = SubmitSubmitting;
  const factory SubmitState.failed(ApiException error) = SubmitFailed;
  const factory SubmitState.done() = SubmitDone;
}
