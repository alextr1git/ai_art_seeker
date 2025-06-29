import 'package:flutter/material.dart';

import '../../../../common/constants/dimens.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.padding12,
        ),
        child: Column(
          spacing: AppDimens.padding10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //
            Text(
              'Start Your Artistic Journey',
              style: textTheme.headlineMedium,
            ),

            Text(
              'Search for inspiring pieces, find your favorite styles, and unlock endless creativity.',
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
