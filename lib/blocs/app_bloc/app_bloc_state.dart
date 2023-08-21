part of 'app_bloc_bloc.dart';

class AppBlocState extends Equatable {
  final int level;
  final int quiz;
  const AppBlocState({
     this.level = 0,
     this.quiz = 0,
  });

  @override
  List<Object> get props => [level,quiz];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'level': level,
      'quiz': quiz,
    };
  }

  factory AppBlocState.fromMap(Map<String, dynamic> map) {
    return AppBlocState(
      level: map['level'] as int,
      quiz: map['quiz'] as int,
    );
  }
}

// class AppBlocInitial extends AppBlocState {
//   const AppBlocInitial({required int level,required int quiz}) : super(level: level,quiz: quiz);
// }
