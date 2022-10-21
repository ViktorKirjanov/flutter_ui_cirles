import 'package:flutter/material.dart';

class MainAvatar extends StatefulWidget {
  const MainAvatar({super.key});

  @override
  State<MainAvatar> createState() => _MainAvatarState();
}

class _MainAvatarState extends State<MainAvatar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1000));

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500))
        .then((value) => _controller.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (_, child) {
        return Transform.scale(
          scale: _controller.value,
          child: Opacity(
            opacity: _controller.value,
            child: Center(
              child: ClipOval(
                child: Image.asset(
                  "assets/photos/4.jpeg",
                  fit: BoxFit.cover,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
