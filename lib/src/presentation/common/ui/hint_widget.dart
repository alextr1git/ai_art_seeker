import 'package:flutter/material.dart';

import '../constants/dimens.dart';

class HintWidget extends StatelessWidget {
  final String text;
  final IconData iconData;
  final Color? elementsColor;
  final TextStyle? style;

  const HintWidget({
    required this.text,
    required this.iconData,
    this.elementsColor,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: <Widget>[
        Icon(
          iconData,
          size: AppDimens.size32,
          color: elementsColor ?? Colors.grey,
        ),
        const SizedBox(height: AppDimens.padding8),
        Text(
          text,
          style: style ??
              textTheme.titleMedium?.copyWith(
                color: elementsColor ?? Colors.grey,
              ),
        ),
      ],
    );
  }
}
