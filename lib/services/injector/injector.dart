import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_proj/router/index.dart';

import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  asExtension: true,
  initializerName: 'init',
)
//register only auth dependencies
void configureAuthDependencies() {
  getIt
    ..registerSingleton(AppRouter())
    ..initAuthScope();
}

//register 'me' scope dependencies (and all other unmarked)
void configureUserDependencies(GetIt getIt) {
  final isRegistered = getIt.isRegistered<EnvironmentFilter>(
    instanceName: kEnvironmentsFilterName,
  );

  if (isRegistered) {
    getIt
      ..unregister<EnvironmentFilter>(instanceName: kEnvironmentsFilterName)
      ..unregister<Set<String>>(instanceName: kEnvironmentsName);
  }

  getIt.init(environment: 'me');
}

//register 'hr' scope dependencies (and all other unmarked)
void configureHrDependencies(GetIt getIt) {
  final isRegistered = getIt.isRegistered<EnvironmentFilter>(
    instanceName: kEnvironmentsFilterName,
  );

  if (isRegistered) {
    getIt
      ..unregister<EnvironmentFilter>(instanceName: kEnvironmentsFilterName)
      ..unregister<Set<String>>(instanceName: kEnvironmentsName);
  }

  final filter = SimpleEnvironmentFilter(
    environments: {'hr'},
    filter: (registerFor) {
      return registerFor.contains('hr');
    },
  );
  getIt.init(environmentFilter: filter);
}
