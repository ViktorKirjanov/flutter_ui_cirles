import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final double mainDiameter;
  final double angle;
  final double avatarSize;

  const User({
    required this.id,
    required this.mainDiameter,
    required this.angle,
    required this.avatarSize,
  });

  @override
  List<Object?> get props => [
        id,
        mainDiameter,
        angle,
        avatarSize,
      ];
}
