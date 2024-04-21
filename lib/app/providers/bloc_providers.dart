import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';

SessionBloc sessionBlocProvider(BuildContext context) {
  return SessionBloc(
    authRepository: context.read<AuthRepository>(),
  );
}