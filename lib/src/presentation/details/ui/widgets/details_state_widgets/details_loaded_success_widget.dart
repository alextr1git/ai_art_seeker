import 'package:flutter/material.dart';

import '../../../../../data/models/details/art_details.dart';
import '../../../../common/constants/app_constants.dart';
import '../../../../common/constants/colors.dart';
import '../../../../common/constants/dimens.dart';
import '../../../../common/ui/bouncing_image_placeholder.dart';
import '../html_section.dart';
import '../row_text_section.dart';
import '../text_section.dart';

class DetailsLoadedSuccessWidget extends StatelessWidget {
  final ArtDetails details;

  const DetailsLoadedSuccessWidget({
    required this.details,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: kDetailsGradientColors,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppDimens.padding16, vertical: AppDimens.padding20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  elevation: 6,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24),
                  ),
                  margin: EdgeInsets.zero,
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: const EdgeInsets.all(16),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: InteractiveViewer(
                              minScale: 0.5,
                              maxScale: 4.0,
                              child: Image.network(
                                details.fullImageUrl,
                                fit: BoxFit.contain,
                                errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) =>
                                    const Icon(Icons.image_not_supported,
                                        size: 80),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24),
                      child: Image.network(
                        details.fullImageUrl,
                        fit: BoxFit.cover,
                        loadingBuilder: (
                          BuildContext context,
                          Widget child,
                          ImageChunkEvent? loadingProgress,
                        ) {
                          if (loadingProgress == null) return child;
                          return const BouncingImagePlaceholder(
                            height: 220,
                            backgroundColor:
                                AppColors.imagePlaceholderBackground,
                          );
                        },
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return const Icon(Icons.image_not_supported,
                              size: 80);
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppDimens.padding20),
                Text(
                  details.title,
                  style: textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.primary,
                  ),
                ),
                const SizedBox(height: AppDimens.padding8),
                TextSection(
                  value: details.date,
                  style: textTheme.titleLarge
                      ?.copyWith(fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: AppDimens.padding8),
                TextSection(
                  value: details.artist,
                  style: textTheme.labelLarge
                      ?.copyWith(color: colorScheme.secondary),
                ),
                const SizedBox(height: AppDimens.padding8),
                Divider(
                    color:
                        colorScheme.outline.withAlpha(AppColors.outlineAlpha)),
                RowTextSection(
                  values: <String?>[
                    details.gallery,
                    details.department,
                  ],
                  style: textTheme.labelLarge,
                ),
                const SizedBox(height: AppDimens.padding16),
                Divider(
                    color:
                        colorScheme.outline.withAlpha(AppColors.outlineAlpha)),
                const SizedBox(height: AppDimens.padding8),
                if (details.artworkTypeTitle != null)
                  TextSection(
                    value: 'Type: ${details.artworkTypeTitle}',
                    style: textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.w500),
                  ),
                if (details.origin != null)
                  TextSection(
                    value: 'Origin: ${details.origin}',
                    style: textTheme.bodyLarge,
                  ),
                if (details.mediumDisplay != null)
                  TextSection(
                    value: 'Medium: ${details.mediumDisplay}',
                    style: textTheme.bodyLarge,
                  ),
                if (details.dimensions != null)
                  TextSection(
                    value: 'Dimensions: ${details.dimensions}',
                    style: textTheme.bodyLarge,
                  ),
                if (details.creditLine != null)
                  TextSection(
                    value: 'Credit: ${details.creditLine}',
                    style: textTheme.bodyMedium,
                  ),
                if (details.isOnView != null)
                  TextSection(
                    value:
                        details.isOnView! ? 'Currently on view' : 'Not on view',
                    style: textTheme.labelLarge?.copyWith(
                        color: details.isOnView! ? Colors.green : Colors.red),
                  ),
                const SizedBox(height: AppDimens.padding8),
                HTMLSection(
                  text: details.description,
                  ignoredTags: AppConstants.IGNORED_TAGS,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
