import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../di/app_di.dart';
import '../../../data/repositories/art_repository.dart';
import '../../../navigation/router.dart';
import '../bloc/search_bloc.dart';
import 'search_content.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (_) => SearchBloc(
        router: appLocator.get<AppRouter>(),
        artRepository: appLocator.get<ArtRepository>(),
      ),
      child: const Scaffold(
        body: SafeArea(
          child: SearchContent(),
        ),
      ),
    );
  }
}
