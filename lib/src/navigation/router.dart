import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../data/repositories/art_repository.dart';
import '../presentation/details/ui/details_screen.dart';
import '../presentation/landing/ui/landing_screen.dart';
import '../presentation/search/ui/search_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AdaptiveRoute<void>(
          initial: true,
          path: '/',
          page: LandingRoute.page,
        ),
        AdaptiveRoute<void>(
          path: '/search',
          page: SearchRoute.page,
        ),
        AdaptiveRoute<void>(
          path: '/details',
          page: DetailsRoute.page,
        ),
      ];
}
