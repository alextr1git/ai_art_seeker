import 'package:flutter/material.dart';

import '../../../common/constants/dimens.dart';
import '../../helpers/details_helper.dart';

class RowTextSection extends StatelessWidget {
  final List<String?> values;
  final double topPadding;
  final double elementsPadding;
  final TextStyle? style;

  const RowTextSection({
    required this.values,
    this.topPadding = AppDimens.padding12,
    this.elementsPadding = AppDimens.padding8,
    this.style,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (values.isEmpty) {
      return const SizedBox();
    }

    final TextTheme textTheme = Theme.of(context).textTheme;

    final List<Widget> rowItems = DetailsHelper.getNullableTextWidgets(
      values: values,
      style: textTheme.labelMedium,
    );

    return Column(
      children: <Widget>[
        SizedBox(height: topPadding),
        Row(children: rowItems),
      ],
    );
  }
}
