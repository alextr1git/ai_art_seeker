import 'package:flutter/material.dart';

import '../constants/dimens.dart';

class ErrorScreen extends StatelessWidget {
  final String errorText;
  final IconData errorIconData;

  const ErrorScreen({
    this.errorText = 'Oops! Something went wrong.\nPlease try again.',
    this.errorIconData = Icons.error_outline,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.padding12,
        ),
        child: Column(
          spacing: AppDimens.padding12,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              errorIconData,
              size: AppDimens.size50,
              color: colorScheme.error,
            ),
            Text(
              errorText,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
