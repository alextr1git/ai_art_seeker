import 'package:flutter/widgets.dart';

import 'app.dart';
import 'di/app_di.dart';

void main() {
  AppDI.initDependencies();

  runApp(const App());
}
