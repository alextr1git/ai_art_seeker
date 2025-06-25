import 'package:flutter/material.dart';

import 'di/app_di.dart';
import 'src/navigation/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(colorSchemeSeed: Colors.blue),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      routerConfig: appLocator.get<AppRouter>().config(),
    );
  }
}
