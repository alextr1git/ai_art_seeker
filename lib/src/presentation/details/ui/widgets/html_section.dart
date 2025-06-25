import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../common/constants/app_constants.dart';
import '../../../common/constants/dimens.dart';

class HTMLSection extends StatelessWidget {
  final String? text;
  final TextTheme? textStyle;
  final Set<String>? ignoredTags;
  final double topPadding;

  const HTMLSection({
    required this.text,
    this.topPadding = AppDimens.padding12,
    this.ignoredTags,
    this.textStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = textStyle ?? Theme.of(context).textTheme;

    return Column(
      children: <Widget>[
        SizedBox(height: topPadding),
        Html(
          data: text ?? AppConstants.EMPTY_TEXT,
          style: <String, Style>{
            'body': Style(
              fontSize: FontSize(textTheme.titleMedium?.fontSize ?? AppDimens.size14),
              fontWeight: FontWeight.normal,
            ),
          },
          doNotRenderTheseTags: ignoredTags,
        ),
      ],
    );
  }
}
