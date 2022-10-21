part of 'avatars_bloc.dart';

abstract class AvatarsEvent extends Equatable {
  const AvatarsEvent();

  @override
  List<Object> get props => [];
}

class InitAvatarsEvent extends AvatarsEvent {
  const InitAvatarsEvent();
}
