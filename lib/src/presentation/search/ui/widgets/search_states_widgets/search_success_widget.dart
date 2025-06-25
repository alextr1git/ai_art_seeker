import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../data/models/preview/art_preview.dart';
import '../../../../common/constants/app_constants.dart';
import '../../../../common/constants/dimens.dart';
import '../../../../common/ui/error_screen.dart';
import '../../../../common/ui/loading_screen.dart';
import '../../../bloc/search_bloc.dart';
import '../search_pagination_states_widgets/search_pagination_success_widget.dart';

class SearchSuccessWidget extends StatefulWidget {
  final List<ArtPreview> artPreviews;
  final SearchPaginationState paginationState;

  const SearchSuccessWidget({
    required this.artPreviews,
    required this.paginationState,
    super.key,
  });

  @override
  State<SearchSuccessWidget> createState() => _SearchSuccessWidgetState();
}

class _SearchSuccessWidgetState extends State<SearchSuccessWidget> {
  late final SearchBloc _bloc = context.read<SearchBloc>();
  final ScrollController _scrollController = ScrollController();

  void _handleScroll() {
    final double offset = _scrollController.offset;
    final double maxOffset = _scrollController.position.maxScrollExtent;

    if (offset < (maxOffset * AppConstants.SCROLL_THRESHOLD)) return;

    _bloc.add(
      SearchScrollEvent(
        offset: offset,
        maxOffset: maxOffset,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_handleScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: AppDimens.padding30),
          sliver: SliverList.separated(
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(height: AppDimens.padding10);
            },
            itemBuilder: (_, int index) {
              final ArtPreview artPreview = widget.artPreviews[index];

              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(
                    horizontal: AppDimens.padding16,
                    vertical: AppDimens.padding8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(AppDimens.padding12),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SizedBox.square(
                      dimension: AppDimens.size70,
                      child: Image.network(
                        artPreview.previewImageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) {
                          return const Icon(
                            Icons.image_not_supported_outlined,
                            size: AppDimens.size40,
                          );
                        },
                      ),
                    ),
                  ),
                  title: Text(
                    artPreview.title,
                    maxLines: AppConstants.TEXT_MAX_LINES,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    <String?>[
                      artPreview.artist,
                      artPreview.date,
                    ].whereType<String>().join(', '),
                    maxLines: AppConstants.TEXT_MAX_LINES,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => _bloc.add(
                    SearchResultSelectedEvent(artPreview: artPreview),
                  ),
                ),
              );
            },
            itemCount: widget.artPreviews.length,
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Center(
            child: switch (widget.paginationState) {
              SearchPaginationLoading() => const LoadingScreen(),
              SearchPaginationFailure() => const ErrorScreen(
                  errorText: 'Failed to load',
                  errorIconData: Icons.warning_amber_rounded,
                ),
              SearchPaginationSuccess(
                :final bool hasReachedEnd,
                :final bool isEmpty,
              ) =>
                SearchPaginationSuccessWidget(
                  hasReachedEnd: hasReachedEnd,
                  isEmpty: isEmpty,
                )
            },
          ),
        ),
      ],
    );
  }
}
