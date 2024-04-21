import 'package:mixter_bloc/mixter_bloc.dart';

class AppEnvironment extends Entity {
  const AppEnvironment();

  static const local = 'local';
  static const prod = 'prod';

  String get name => const String.fromEnvironment('env');

  // SUPABASE
  String get supabaseUrl => const String.fromEnvironment('SUPABASE_URL');

  String get supabaseAnonKey =>
      const String.fromEnvironment('SUPABASE_ANON_KEY');

  @override
  List<Object?> get props => [name];
}
