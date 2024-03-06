part of 'prompt_bloc.dart';

@immutable
sealed class PromptState {}

final class PromptInitial extends PromptState {}

final class PromptGeneratingImageLoadState extends PromptState {}

final class PromptGeneratingImageErrorState extends PromptState {}

final class PromptGeneratingImageSucessState extends PromptState {
  final Uint8List uint8list;
  PromptGeneratingImageSucessState(this.uint8list);
}
