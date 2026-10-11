import 'package:bloc/bloc.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/features/auth/data/auth_repository.dart';
import 'package:maki_mobile/features/auth/presentation/cubit/submit_state.dart';

/// Changes the signed-in user's password, then reloads the user, which
/// clears must_change_password and lets the router past this screen.
class ChangePasswordCubit extends Cubit<SubmitState> {
  ChangePasswordCubit(this._auth, this._session)
    : super(const SubmitState.idle());

  final AuthRepository _auth;
  final SessionCubit _session;

  Future<void> submit({required String current, required String next}) async {
    if (state is SubmitSubmitting) return;
    emit(const SubmitState.submitting());
    try {
      await _auth.changePassword(current, next);
      _session.updateUser(await _auth.me());
      emit(const SubmitState.done());
    } on ApiException catch (error) {
      emit(SubmitState.failed(error));
    }
  }
}
