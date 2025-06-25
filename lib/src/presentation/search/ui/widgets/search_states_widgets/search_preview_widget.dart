import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/preview/art_preview.dart';
import '../../../../common/ui/error_screen.dart';
import '../../../../common/ui/loading_screen.dart';
import '../../../bloc/search_bloc.dart';
import 'search_idle_widget.dart';
import 'search_success_widget.dart';

class SearchPreviewWidget extends StatelessWidget {
  const SearchPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (_, SearchState state) {
        return switch (state) {
          SearchIdle() => const SearchIdleWidget(),
          SearchLoading() => const LoadingScreen(),
          SearchFailure() => const ErrorScreen(),
          SearchSuccess(
            :final List<ArtPreview> artPreviews,
            :final SearchPaginationState paginationState,
          ) =>
            SearchSuccessWidget(
              artPreviews: artPreviews,
              paginationState: paginationState,
            ),
        };
      },
    );
  }
}
