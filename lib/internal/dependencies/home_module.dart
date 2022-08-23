import 'package:myapp/internal/dependencies/repository_module.dart';

import 'package:myapp/domain/state/home/home_state.dart';

class HomeModule {
  static HomeState homeState() {
    return HomeState(
      RepositoryModule.dayRepository(),
    );
  }
}