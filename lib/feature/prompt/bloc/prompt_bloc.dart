import 'dart:async';
import 'dart:io';

import 'dart:typed_data';

import 'package:ai_image_generator/feature/prompt/repos/prompt_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'prompt_event.dart';
part 'prompt_state.dart';

class PromptBloc extends Bloc<PromptEvent, PromptState> {
  PromptBloc() : super(PromptInitial()) {
    on<PromptInitialEvent>(promptInitialEvent);
    on<PromptEnteredEvent>(promptEnteredEvent);
  }
  FutureOr<void> promptEnteredEvent(
      PromptEnteredEvent event, Emitter<PromptState> emit) async {
    emit(PromptGeneratingImageLoadState());
    Uint8List? bytes = await PromptRepo.generateImage(event.prompt);
    if (bytes != null) {
      emit(PromptGeneratingImageSucessState(bytes));
    } else {
      emit(PromptGeneratingImageErrorState());
    }
  }

  FutureOr<void> promptInitialEvent(
      PromptInitialEvent event, Emitter<PromptState> emit) async {
    Uint8List bytes = await File(
            'C:/Users/winni/StudioProjects/AI_image_generator/image/file.png')
        .readAsBytes();
    emit(PromptGeneratingImageSucessState(bytes));
  }
}
