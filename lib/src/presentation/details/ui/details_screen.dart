import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/art_repository.dart';
import '../../../navigation/router.dart';
import '../bloc/details_bloc.dart';
import 'details_content.dart';

@RoutePage()
class DetailsScreen extends StatelessWidget {
  final int artId;
  final AppRouter router;
  final ArtRepository artRepository;

  const DetailsScreen({
    required this.artId,
    required this.router,
    required this.artRepository,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailsBloc>(
      create: (_) => DetailsBloc(
        artRepository: artRepository,
      )..add(
          FetchDetailsEvent(artId: artId),
        ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: router.popUntilRoot,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: const SafeArea(
          child: DetailsContent(),
        ),
      ),
    );
  }
}
