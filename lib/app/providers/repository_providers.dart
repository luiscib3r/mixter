import 'package:mixter/app/app.dart';
import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:mixter_supabase/mixter_supabase.dart';

AuthRepository authRepositoryProvider(BuildContext context) {
  return const AuthRepositorySupabase();
}
