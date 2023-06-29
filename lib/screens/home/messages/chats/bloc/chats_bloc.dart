import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:test_proj/models/index.dart';
import 'package:test_proj/repositories/index.dart';

part 'chats_event.dart';
part 'chats_state.dart';
part 'chats_bloc.freezed.dart';

@lazySingleton
class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {
  ChatsBloc({
    required this.repository,
  }) : super(const ChatsState()) {
    on<_Load>(_load);
  }

  final ChatsRepository repository;

  FutureOr<void> _load(_Load event, Emitter<ChatsState> emit) async {
    emit(state.copyWith(status: NetworkStatus.loading));

    try {
      final chats = await repository.getChats();

      emit(ChatsState.success(chats));
    } catch (_) {
      emit(state.copyWith(status: NetworkStatus.failure));
    }
  }
}
