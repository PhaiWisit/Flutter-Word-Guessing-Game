part of 'app_bloc_bloc.dart';

class AppBlocState extends Equatable {
  final int quizLevel;
  const AppBlocState({
    required this.quizLevel ,
    
  });

  @override
  List<Object> get props => [quizLevel];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quizLevel': quizLevel,
    };
  }

  factory AppBlocState.fromMap(Map<String, dynamic> map) {
    return AppBlocState(
      quizLevel: map['quizLevel'] as int,
    );
  }
  
  

  
}

class AppBlocInitial extends AppBlocState {
  const AppBlocInitial({required int quizLevel}) : super(quizLevel: quizLevel);
}
