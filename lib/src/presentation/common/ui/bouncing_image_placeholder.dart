import 'package:flutter/material.dart';
import '../constants/colors.dart';

class BouncingImagePlaceholder extends StatefulWidget {
  final double size;
  final Color? backgroundColor;
  final double? height;

  const BouncingImagePlaceholder({
    this.size = 64,
    this.backgroundColor,
    this.height,
    super.key,
  });

  @override
  State<BouncingImagePlaceholder> createState() =>
      _BouncingImagePlaceholderState();
}

class _BouncingImagePlaceholderState extends State<BouncingImagePlaceholder>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1200),
  )..repeat(reverse: true);

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(0, 0.1),
    end: const Offset(0, -0.1),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOut,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final SlideTransition icon = SlideTransition(
      position: _offsetAnimation,
      child: Icon(
        Icons.image,
        size: widget.size,
        color: AppColors.imagePlaceholderIcon,
      ),
    );
    if (widget.backgroundColor != null || widget.height != null) {
      return Container(
        height: widget.height,
        color: widget.backgroundColor,
        child: Center(child: icon),
      );
    }
    return icon;
  }
}
