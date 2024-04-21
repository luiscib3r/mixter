import 'package:mixter_bloc/mixter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart' as supabase;

extension UserModelMapper on supabase.User {
  User get entity => User(
        id: id,
        email: email ?? '',
      );
}
