import 'package:firebase_core/firebase_core.dart';
import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miss_you/app_bloc_observer.dart';
import 'package:miss_you/blocs/auth/auth_bloc.dart';
import 'package:miss_you/config/routes.dart';
import 'package:miss_you/firebase_options.dart';
import 'package:miss_you/repositories/auth_repository.dart';
import 'package:miss_you/theme.dart';

Future<void> main() async {
  Bloc.observer = const AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final authRepository = AuthRepository();
  runApp(MainApp(authRepository: authRepository));
}

class MainApp extends StatelessWidget {
  const MainApp({required AuthRepository authRepository, super.key})
      : _authRepository = authRepository;
  final AuthRepository _authRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepository,
      child: BlocProvider(
        create: (_) => AuthBloc(authRepository: _authRepository),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme)
            .copyWith(bodyMedium: const TextStyle(color: primaryTextColor)),
      ),
      debugShowCheckedModeBanner: false,
      home: FlowBuilder(
        state: context.select((AuthBloc bloc) => bloc.state.status),
        onGeneratePages: onGenerateAppViewPages,
      ),
    );
  }
}
