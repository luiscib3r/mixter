import 'package:mixter_bloc/mixter_bloc.dart';

sealed class AppEnvironment extends Environment {
  factory AppEnvironment({required String env}) => switch (env) {
        AppEnvironment.local => const AppEnvironmentLocal(),
        AppEnvironment.prod => const AppEnvironmentProd(),
        _ => throw Exception('Unknown environment: $env'),
      };

  const AppEnvironment._({required super.name});

  static const local = 'local';
  static const prod = 'prod';

  @override
  List<Object?> get props => [name];
}

class AppEnvironmentLocal extends AppEnvironment {
  const AppEnvironmentLocal() : super._(name: AppEnvironment.local);
}

class AppEnvironmentProd extends AppEnvironment {
  const AppEnvironmentProd() : super._(name: AppEnvironment.prod);
}
