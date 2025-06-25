import 'package:flutter/material.dart';

class DetailsHelper {
  static List<Widget> getNullableTextWidgets({
    required List<String?> values,
    TextStyle? style,
    double? elementsPadding,
  }) {
    final List<Widget> rowItems = <Widget>[];

    for (int i = 0; i < values.length; i++) {
      final String? text = values[i];
      if (text != null) {
        rowItems.add(
          Text(
            text,
            style: style,
          ),
        );

        rowItems.add(
          SizedBox(width: elementsPadding),
        );
      }
    }

    return rowItems;
  }
}
