import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui_circles/data.dart';

part 'avatars_event.dart';
part 'avatars_state.dart';

class AvatarsBloc extends Bloc<AvatarsEvent, AvatarsState> {
  AvatarsBloc() : super(InitialAvatarsState()) {
    on<InitAvatarsEvent>((event, emit) async {
      await Future.delayed(const Duration(milliseconds: 2000));
      for (var i = 1; i <= UserData.getUsers().length; i++) {
        await Future.delayed(const Duration(milliseconds: 50));
        emit(CompleteAvatarsState(i));
      }

      await Future.delayed(const Duration(milliseconds: 1000));
      do {
        for (var i = 1; i <= UserData.getUsers().length; i++) {
          await Future.delayed(const Duration(milliseconds: 1500));
          emit(UpdateAvatarsState(i));
        }
      } while (true);
    });
  }
}
