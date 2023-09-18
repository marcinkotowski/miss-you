import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:miss_you/models/user_model.dart';
import 'package:miss_you/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(
          authRepository.currentUser.isNotEmpty
              ? AuthState.authenticated(authRepository.currentUser)
              : const AuthState.unauthenticated(),
        ) {
    on<AuthUserChanged>(_onUserChanged);
    on<AuthLogoutRequest>(_onLogoutRequested);

    _userSubscription =
        _authRepository.user.listen((user) => add(AuthUserChanged(user)));
  }
  final AuthRepository _authRepository;
  StreamSubscription<User>? _userSubscription;

  void _onUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emitter,
  ) {
    // ignore: invalid_use_of_visible_for_testing_member
    emit(
      event.user.isNotEmpty
          ? AuthState.authenticated(event.user)
          : const AuthState.unauthenticated(),
    );
  }

  void _onLogoutRequested(
    AuthLogoutRequest event,
    Emitter<AuthState> emitter,
  ) {
    unawaited(_authRepository.signOut());
  }

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }
}
