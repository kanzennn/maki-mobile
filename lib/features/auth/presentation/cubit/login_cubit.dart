import 'package:bloc/bloc.dart';
import 'package:maki_mobile/core/api/api_exception.dart';
import 'package:maki_mobile/core/auth/session_cubit.dart';
import 'package:maki_mobile/features/auth/data/auth_repository.dart';
import 'package:maki_mobile/features/auth/presentation/cubit/submit_state.dart';

/// Signs in. On success the session changes, and the router's redirect takes
/// the user on from the sign-in screen.
class LoginCubit extends Cubit<SubmitState> {
  LoginCubit(this._auth, this._session) : super(const SubmitState.idle());

  final AuthRepository _auth;
  final SessionCubit _session;

  Future<void> submit({
    required String username,
    required String password,
  }) async {
    if (state is SubmitSubmitting) return;
    emit(const SubmitState.submitting());
    try {
      await _session.start(await _auth.login(username, password));
      emit(const SubmitState.done());
    } on ApiException catch (error) {
      emit(SubmitState.failed(error));
    }
  }
}
