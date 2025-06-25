import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/constants/app_constants.dart';
import '../../../common/constants/dimens.dart';
import '../../bloc/search_bloc.dart';
import '../../helpers/search_bar_helper.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late final SearchBloc _bloc = context.read<SearchBloc>();

  List<String> showedSuggestions = <String>[];

  void _handleQueryChanged(String query) {
    _bloc.add(
      SearchQueryEvent(query: query),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
      isFullScreen: false,
      viewOnChanged: _handleQueryChanged,
      viewConstraints: BoxConstraints.loose(
        const Size.fromHeight(AppConstants.MAX_SUGGESTIONS_SECTION_HEIGHT),
      ),
      builder: (_, SearchController controller) {
        return Focus(
          onFocusChange: (bool isFocused) {
            if (isFocused) {
              _bloc.add(
                UpdateSearchSuggestionsEvent(
                  suggestion: controller.text,
                ),
              );
            } else {
              final List<String> updatedSuggestions =
                  SearchBarHelper.updateSuggestions(
                allSuggestions:
                    _bloc.state.suggestions.toList().reversed.toList(),
                query: controller.text,
              );

              setState(() {
                showedSuggestions = updatedSuggestions;
              });
            }
          },
          child: SearchBar(
            hintText: 'Search art',
            controller: controller,
            padding: const WidgetStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: AppDimens.padding12),
            ),
            onTap: controller.openView,
            onChanged: (String query) => controller.openView(),
            leading: const Icon(Icons.search),
            trailing: <Widget>[
              if (controller.text.isNotEmpty)
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    _handleQueryChanged('');
                  },
                ),
            ],
          ),
        );
      },
      suggestionsBuilder: (_, SearchController controller) {
        final List<String> updatedSuggestions =
            SearchBarHelper.updateSuggestions(
          allSuggestions: _bloc.state.suggestions.toList().reversed.toList(),
          query: controller.text,
        );

        if (updatedSuggestions.isEmpty) {
          return <Widget>[
            Padding(
              padding: const EdgeInsets.all(AppDimens.padding16),
              child: Text(
                'No suggestions available',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
          ];
        }

        setState(() {
          showedSuggestions = updatedSuggestions;
        });

        return showedSuggestions.map(
          (String suggestion) {
            return SizedBox(
              height: AppConstants.SUGGESTION_HEIGHT,
              child: ListTile(
                leading: const Icon(Icons.watch_later_outlined),
                title: Text(suggestion),
                onTap: () => controller.closeView(suggestion),
              ),
            );
          },
        );
      },
    );
  }
}
