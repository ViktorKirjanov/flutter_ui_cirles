import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MainAvatarBorder extends StatefulWidget {
  final double size;
  final Color color;
  final Duration duration;
  final Duration scaleDurationDelay;

  const MainAvatarBorder({
    super.key,
    required this.size,
    required this.color,
    required this.duration,
    this.scaleDurationDelay = const Duration(milliseconds: 0),
  });

  @override
  State<MainAvatarBorder> createState() => _MainAvatarBorderState();
}

class _MainAvatarBorderState extends State<MainAvatarBorder>
    with TickerProviderStateMixin {
  late final AnimationController _angleController =
      AnimationController(vsync: this, duration: widget.duration)..repeat();

  late final AnimationController _scaleController =
      AnimationController(vsync: this, duration: const Duration(seconds: 1));

  @override
  void initState() {
    super.initState();
    Future.delayed(widget.scaleDurationDelay)
        .then((value) => _scaleController.forward());
  }

  @override
  void dispose() {
    _angleController.dispose();
    _scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: Listenable.merge([_scaleController, _angleController]),
        builder: (_, child) {
          return Transform.scale(
            scale: _scaleController.value,
            child: Transform.rotate(
              angle: -_angleController.value * 2 * math.pi,
              child: DottedBorder(
                borderType: BorderType.Circle,
                strokeWidth: 2.0,
                color: widget.color,
                dashPattern: const [6, 6],
                child: SizedBox(
                  height: widget.size,
                  width: widget.size,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
