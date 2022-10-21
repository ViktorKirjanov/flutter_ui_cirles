import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_circles/blocks/bloc/avatars_bloc.dart';
import 'dart:math' as math;

import 'package:flutter_ui_circles/models/user_model.dart';

class CircleAvatae extends StatefulWidget {
  final Size size;
  final User user;

  const CircleAvatae({
    super.key,
    required this.size,
    required this.user,
  });

  @override
  State<CircleAvatae> createState() => _CircleAvataeState();
}

class _CircleAvataeState extends State<CircleAvatae>
    with TickerProviderStateMixin {
  late AnimationController _angleAnimation;
  late AnimationController _sizeAnimation;
  late int id;

  @override
  void initState() {
    super.initState();
    id = widget.user.id;
    _angleAnimation = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 6.283,
      duration: const Duration(seconds: 60),
    )..repeat();

    _sizeAnimation = AnimationController(
      vsync: this,
      lowerBound: 0,
      upperBound: 1,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _angleAnimation.dispose();
    _sizeAnimation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AvatarsBloc, AvatarsState>(
      listener: (context, state) async {
        if (state is CompleteAvatarsState && state.id == widget.user.id) {
          _sizeAnimation.forward();
        }

        if (state is UpdateAvatarsState && state.id == widget.user.id) {
          _sizeAnimation.reverse();
          await Future.delayed(const Duration(milliseconds: 1000));
          setState(() {
            if (id == 24) {
              id = 1;
            } else {
              id++;
            }
          });

          _sizeAnimation.forward();
        }
      },
      builder: (context, state) {
        return AnimatedBuilder(
          animation: Listenable.merge([_angleAnimation, _sizeAnimation]),
          builder: ((context, child) {
            final dx = widget.user.mainDiameter / 2; // center of x(in a circle)
            final dy = widget.user.mainDiameter / 2; // center of y(in a circle)
            final r = widget.user.mainDiameter / 2; // radius of a circle
            final left =
                dx + (r * math.cos(widget.user.angle + _angleAnimation.value));
            final top =
                dy + (r * math.sin(widget.user.angle + _angleAnimation.value));
            final leftOffset = widget.size.width / 2 -
                widget.user.mainDiameter / 2 -
                widget.user.avatarSize / 2;
            final topOffset = widget.size.height / 2 -
                widget.user.mainDiameter / 2 -
                widget.user.avatarSize / 2;
            final size = widget.user.avatarSize * _sizeAnimation.value;
            final dScale = (widget.user.avatarSize - size) / 2;

            return Positioned(
              left: left + leftOffset + dScale,
              top: top + topOffset + dScale,
              child: Container(
                height: size,
                width: size,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: Colors.grey.shade300,
                  ),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    "assets/photos/$id.jpeg",
                    fit: BoxFit.cover,
                    width: size,
                    height: size,
                  ),
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
