part of 'vocab_bloc.dart';

abstract class VocabEvent extends Equatable {
  const VocabEvent();

  @override
  List<Object> get props => [];
}


class GetVocabList extends VocabEvent {
  final int level;
  final int quiz;

  const GetVocabList(this.level,this.quiz);

  @override
  List<Object> get props => [];
}

class GetVocabRandomList extends VocabEvent {
  const GetVocabRandomList();

  @override
  List<Object> get props => [];
}
