part of 'sign_up_cubit.dart';

enum SignUpStatus { initial, submitting, success, error }

class SignUpState extends Equatable {
  const SignUpState({
    required this.email,
    required this.password,
    required this.status,
  });

  factory SignUpState.initial() {
    return const SignUpState(
      email: '',
      password: '',
      status: SignUpStatus.initial,
    );
  }
  final String email;
  final String password;
  final SignUpStatus status;

  @override
  List<Object> get props => [email, password, status];

  SignUpState copyWith({
    String? email,
    String? password,
    SignUpStatus? status,
  }) {
    return SignUpState(
      email: email ?? this.email,
      password: password ?? this.password,
      status: status ?? this.status,
    );
  }
}
