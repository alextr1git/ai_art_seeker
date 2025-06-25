import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/ui/error_screen.dart';
import '../../common/ui/loading_screen.dart';
import '../bloc/details_bloc.dart';
import 'widgets/details_state_widgets/details_loaded_success_widget.dart';

class DetailsContent extends StatelessWidget {
  const DetailsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (_, DetailsState state) {
        return switch (state) {
          DetailsLoading() => const LoadingScreen(),
          DetailsLoaded() => DetailsLoadedSuccessWidget(details: state.details),
          DetailsLoadFailure() => const ErrorScreen(),
        };
      },
    );
  }
}
