import 'package:supabase_flutter/supabase_flutter.dart';

export 'src/mixter_supabase.dart';

Future<void> setupSupabase({
  required String supabaseUrl,
  required String supabaseAnonKey,
}) =>
    Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
