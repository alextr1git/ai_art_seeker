import 'package:flutter/material.dart';

import '../../common/constants/constants.dart';
import 'widgets/search_bar_widget.dart';
import 'widgets/search_states_widgets/search_preview_widget.dart';

class SearchContent extends StatelessWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: kLandingGradientColors,
        ),
      ),
      child: const Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(
              AppDimens.padding16,
              AppDimens.padding16,
              AppDimens.padding16,
              AppDimens.padding0,
            ),
            child: SearchBarWidget(),
          ),
          Expanded(
            child: SearchPreviewWidget(),
          ),
        ],
      ),
    );
  }
}
