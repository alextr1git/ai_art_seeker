import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../src/data/repositories/art_repository.dart';
import '../src/data/repositories/art_repository_impl.dart';
import '../src/navigation/router.dart';

final GetIt appLocator = GetIt.instance;

abstract class AppDI {
  static void initDependencies() {
    appLocator.registerSingleton<AppRouter>(AppRouter());

    appLocator.registerSingleton<Dio>(
      Dio(
        BaseOptions(
          followRedirects: false,
          baseUrl: 'https://api.artic.edu/api/v1',
        ),
      )..interceptors.add(
          LogInterceptor(
            requestBody: true,
            responseBody: true,
          ),
        ),
    );

    appLocator.registerSingleton<ArtRepository>(
      ArtRepositoryImpl(
        appLocator.get<Dio>(),
      ),
    );
  }
}
