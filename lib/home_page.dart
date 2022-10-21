import 'package:flutter/material.dart';
import 'package:flutter_ui_circles/_widgets/avatar_border.dart';
import 'package:flutter_ui_circles/_widgets/buttons/auth_buttons.dart';
import 'package:flutter_ui_circles/_widgets/circle_avatar.dart';
import 'package:flutter_ui_circles/_widgets/main_avatar.dart';
import 'package:flutter_ui_circles/data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildMainAvatar(context),
          const AuthButtons(),
        ],
      ),
    );
  }

  Widget _buildMainAvatar(context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 200,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          MainAvatarBorder(
            size: 115.0,
            color: Colors.blueAccent.withOpacity(.25),
            duration: const Duration(seconds: 40),
            scaleDurationDelay: const Duration(milliseconds: 1000),
          ),
          MainAvatarBorder(
            size: 130.0,
            color: Colors.blueAccent.withOpacity(.5),
            duration: const Duration(seconds: 50),
            scaleDurationDelay: const Duration(milliseconds: 500),
          ),
          MainAvatarBorder(
            size: 145.0,
            color: Colors.blueAccent.withOpacity(.85),
            duration: const Duration(seconds: 60),
          ),
          const MainAvatar(),
          ..._buildCircles(context),
        ],
      ),
    );
  }

  List<Widget> _buildCircles(context) {
    return UserData.getUsers()
        .map(
          (user) => CircleAvatae(
            size: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height - 200,
            ),
            user: user,
          ),
        )
        .toList();
  }
}
