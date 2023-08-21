part of 'vocab_bloc.dart';

abstract class VocabState extends Equatable {
//   const VocabState();
  
//   @override
//   List<Object> get props => [];
}

  class VocabLoadingState extends VocabState {
  VocabLoadingState();

  @override
  List<Object?> get props => [];
}

class VocabLoadedState extends VocabState {
  final List<VocabModel> vocabList;
  
  VocabLoadedState(this.vocabList) ;
  @override
  List<Object?> get props => [vocabList];
}

class VocabErrorState extends VocabState {
  final String error;
  VocabErrorState(this.error) ;
  @override
  List<Object?> get props => [error];
}

// class VocabInitial extends VocabState {}
