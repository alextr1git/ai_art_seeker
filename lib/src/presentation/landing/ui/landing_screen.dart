import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../di/app_di.dart';
import '../../../navigation/router.dart';
import 'landing_content.dart';

@RoutePage()
class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LandingContent(
        router: appLocator.get<AppRouter>(),
      ),
    );
  }
}
