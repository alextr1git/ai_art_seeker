import 'package:flutter/material.dart';

import '../../../../common/ui/error_screen.dart';
import '../../../../common/ui/hint_widget.dart';

class SearchPaginationSuccessWidget extends StatelessWidget {
  final bool hasReachedEnd;
  final bool isEmpty;

  const SearchPaginationSuccessWidget({
    required this.hasReachedEnd,
    required this.isEmpty,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isEmpty
        ? const ErrorScreen(
            errorIconData: Icons.search_off,
            errorText: 'Nothing found',
          )
        : const HintWidget(
            text: 'You’re all caught up!',
            iconData: Icons.check_circle_outline,
          );
  }
}
