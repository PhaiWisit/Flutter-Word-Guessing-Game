import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:word_test/screens/home_screen/home_screen.dart';
import 'package:word_test/screens/list_screen/list_screen.dart';
import 'package:word_test/screens/quiz_screen/quiz_screen.dart';
import 'package:word_test/screens/setting_screen/setting_screen.dart';
import 'package:word_test/screens/test_screen/test_screen.dart';
import 'package:word_test/utils/app_router.dart';
import 'package:word_test/utils/app_theme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'blocs/blocs_export.dart';
import 'database/database_helper.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(
      MyApp(
        appRouter: AppRouter(),
      ),
    ),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  MyApp({super.key, required this.appRouter});

  
  

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBlocBloc()),
        BlocProvider(create: (context) => SettingBloc()),
        BlocProvider(create: (context) => LevelBloc()),
      ],
      child: BlocBuilder<SettingBloc, SettingState>(
        builder: (context, state) {
          ThemeData? themeData = AppThemes.appThemeData[AppTheme.defaultTheme];

          switch (state.themeSelected) {
            case 1:
              themeData = AppThemes.appThemeData[AppTheme.defaultTheme];
              break;
            case 2:
              themeData = AppThemes.appThemeData[AppTheme.darkTheme];
              break;
            case 3:
              themeData = AppThemes.appThemeData[AppTheme.colorFulTheme];
              break;
            case 4:
              themeData = AppThemes.appThemeData[AppTheme.cuteTheme];
              break;
            default:
              themeData = AppThemes.appThemeData[AppTheme.defaultTheme];
              break;
          }
          return MaterialApp(
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              },
            ),
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: const HomeScreen(),
            // home: const QuizScreen(),
            // home: const ListScreen(),s
            // home: const SettingScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
