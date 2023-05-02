part of 'app_bloc_bloc.dart';

class AppBlocState extends Equatable {
  final int quizLevel;
  final bool switchTheme;
  const AppBlocState({
    this.quizLevel = 0,
    required this.switchTheme ,
    
  });

  @override
  List<Object> get props => [quizLevel, switchTheme];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'quizLevel': quizLevel,
      'switchTheme': switchTheme
    };
  }

  factory AppBlocState.fromMap(Map<String, dynamic> map) {
    return AppBlocState(
      quizLevel: map['quizLevel'] as int,
      switchTheme: map['switchTheme'] as bool,
    );
  }
  
  

  
}

// class AppBlocInitial extends AppBlocState {
//   const AppBlocInitial({required bool switchTheme}) : super(switchTheme: switchTheme);
// }
