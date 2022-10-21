import 'package:flutter/material.dart';
import 'package:flutter_ui_circles/_widgets/buttons/facebook_button.dart';
import 'package:flutter_ui_circles/_widgets/buttons/instagram_button.dart';

class AuthButtons extends StatefulWidget {
  const AuthButtons({super.key});

  @override
  State<AuthButtons> createState() => _AuthButtonsState();
}

class _AuthButtonsState extends State<AuthButtons>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 500));

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000))
        .then((value) => _controller.forward());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: AnimatedBuilder(
          animation: _controller,
          builder: ((context, child) => Opacity(
                opacity: _controller.value,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InstagramButton(onTap: () {}),
                    const SizedBox(height: 16.0),
                    FacebookButton(onTap: () {}),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
