import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseDataSource {
  const SupabaseDataSource();

  SupabaseClient get supabase => Supabase.instance.client;
}
