import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fresh_dio/fresh_dio.dart';
import 'package:injectable/injectable.dart';

import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/index.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@Singleton(scope: 'auth')
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final UserRepository userRepository;

  late StreamSubscription<AuthenticationStatus> _subscription;

  AuthBloc({
    required this.authRepository,
    required this.userRepository,
  }) : super(const AuthState()) {
    _subscription = authRepository.authenticationStatus.listen((status) {
      add(AuthEvent.authenticationStatusChanged(status));
    });

    on<_AuthenticationStatusChanged>(_authenticationStatusChanged);
    on<_SignOut>(_signOut);
  }

  FutureOr<void> _authenticationStatusChanged(
    _AuthenticationStatusChanged event,
    Emitter<AuthState> emit,
  ) async {
    if (event.status == AuthenticationStatus.authenticated) {
      try {
        final userProfile = await userRepository.getUserProfile();

        emit(AuthState.authenticated(userProfile));
      } catch (_) {
        emit(AuthState.unauthenticated());
      }
    } else {
      emit(
        state.copyWith(
          status: event.status,
          userProfile: const UserProfile(),
        ),
      );
    }
  }

  FutureOr<void> _signOut(_SignOut event, Emitter<AuthState> emit) {
    return authRepository.signOut();
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
