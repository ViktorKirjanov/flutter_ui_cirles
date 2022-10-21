part of 'avatars_bloc.dart';

abstract class AvatarsState extends Equatable {
  const AvatarsState();

  @override
  List<Object> get props => [];
}

class InitialAvatarsState extends AvatarsState {}

class CompleteAvatarsState extends AvatarsState {
  final int id;

  const CompleteAvatarsState(this.id);

  @override
  List<Object> get props => [id];
}

class UpdateAvatarsState extends AvatarsState {
  final int id;

  const UpdateAvatarsState(this.id);

  @override
  List<Object> get props => [id];
}
