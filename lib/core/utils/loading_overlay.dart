import 'package:flutter/material.dart';

import '../extensions/context_extensions.dart';

class LoadingOverlay {
  static OverlayEntry? _overlayEntry;

  static void show(
    BuildContext context, {
    String message = 'Loading',
    bool isDismissible = false,
  }) {
    if (_overlayEntry != null) {
      return;
    }
    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          AbsorbPointer(
            absorbing: !isDismissible,
            child: Container(color: Colors.grey.withValues(alpha: 0.6)),
          ),
          Center(
            child: Material(
              color: Colors.transparent,
              child: _LoadingContent(message: message),
            ),
          ),
        ],
      ),
    );

    final rootOverlay =
        Navigator.of(context, rootNavigator: true).overlay ??
        Overlay.of(context, rootOverlay: true);

    rootOverlay.insert(_overlayEntry!);
  }

  static void hide() {
    if (_overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = null;
    }
  }
}

class _LoadingContent extends StatelessWidget {
  final String message;

  const _LoadingContent({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Column(
        spacing: 2,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const _LoadingIconAnimation(),
          Text(
            message,
            style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _LoadingIconAnimation extends StatefulWidget {
  const _LoadingIconAnimation();

  @override
  _LoadingIconAnimationState createState() => _LoadingIconAnimationState();
}

class _LoadingIconAnimationState extends State<_LoadingIconAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(context.assets.logoSMOverlayGrey, height: 64, width: 64),
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return ClipPath(
              clipper: _LoadingIconClipper(animationValue: _animation.value),
              child: Image.asset(context.assets.logoSM, height: 64, width: 64),
            );
          },
        ),
      ],
    );
  }
}

class _LoadingIconClipper extends CustomClipper<Path> {
  const _LoadingIconClipper({required this.animationValue});
  final double animationValue;

  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * (1 - animationValue));
    path.lineTo(size.width, size.height * (1 - animationValue));
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant _LoadingIconClipper oldClipper) {
    return oldClipper.animationValue != animationValue;
  }
}
