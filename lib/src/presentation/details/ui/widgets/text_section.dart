import 'package:flutter/material.dart';

import '../../../common/constants/dimens.dart';

class TextSection extends StatelessWidget {
  final double topPadding;
  final String? value;
  final TextStyle? style;

  const TextSection({
    required this.value,
    this.topPadding = AppDimens.padding12,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final String? text = value;

    return text != null
        ? Column(
            children: <Widget>[
              SizedBox(height: topPadding),
              Text(
                text,
                style: style ?? textTheme.labelMedium,
              ),
            ],
          )
        : const SizedBox();
  }
}
