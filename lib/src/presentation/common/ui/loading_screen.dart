import 'package:flutter/material.dart';
import 'bouncing_image_placeholder.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: BouncingImagePlaceholder(),
    );
  }
}
