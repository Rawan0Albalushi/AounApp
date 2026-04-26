import 'package:flutter_test/flutter_test.dart';

import 'package:aoun_app/core/router/app_router.dart';
import 'package:aoun_app/core/router/app_routes.dart';

void main() {
  test('AppRouter exposes expected named routes', () {
    final routes = AppRouter.routes;
    expect(routes.containsKey(AppRoutes.login), isTrue);
    expect(routes.containsKey(AppRoutes.main), isTrue);
    expect(routes.containsKey(AppRoutes.taskList), isTrue);
    expect(routes.containsKey(AppRoutes.changePassword), isTrue);
  });
}
