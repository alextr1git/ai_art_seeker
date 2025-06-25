import 'package:flutter/material.dart';

import '../../../navigation/router.dart';
import '../../../theme/assets.dart';
import '../../common/constants/constants.dart';

class LandingContent extends StatelessWidget {
  final AppRouter router;

  const LandingContent({
    required this.router,
    super.key,
  });

  void _handleContinueTap() {
    router.replaceNamed(AppConstants.SEARCH_ROUTE);
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: kLandingGradientColors,
        ),
      ),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimens.padding60,
              horizontal: AppDimens.padding20,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppDimens.radius40),
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: Colors.black.withAlpha(AppConstants.shadowAlpha),
                        blurRadius: AppDimens.shadowBlurRadius,
                        offset: const Offset(0, AppDimens.shadowOffsetY),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(AppDimens.radius40),
                    child: Image.asset(
                      Assets.staryNightImagePath,
                      fit: BoxFit.cover,
                      height: AppDimens.landingImageHeight,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: AppDimens.padding40),
                Text(
                  'Welcome to Art Seeker',
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppDimens.padding10),
                Text(
                  'Your gateway to discovering, exploring, and enjoying unique artworks from around the world. Search, zoom, and learn about masterpieces and hidden gems alike. Start your art journey now!',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface.withAlpha(178),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: AppDimens.padding30),
                Text(
                  'Curated for you',
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.1,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: AppDimens.buttonPaddingVertical),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(AppDimens.radiusButton),
                      ),
                      backgroundColor: colorScheme.primary,
                      foregroundColor: colorScheme.onPrimary,
                      textStyle: textTheme.titleMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                      elevation: AppDimens.buttonElevation,
                    ),
                    child: const Text('Explore art'),
                    onPressed: _handleContinueTap,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
