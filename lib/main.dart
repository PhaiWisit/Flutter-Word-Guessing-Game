import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:word_test/blocs/app_bloc/app_bloc_bloc.dart';
import 'package:word_test/screens/home_screen/home_screen.dart';
import 'package:word_test/utils/app_router.dart';
import 'package:word_test/utils/app_theme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'blocs/blocs_export.dart';

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
        // BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<AppBlocBloc, AppBlocState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: state.switchTheme == false
                ? AppThemes.appThemeData[AppTheme.lightTheme]
                : AppThemes.appThemeData[AppTheme.darkTheme],
            home: const HomeScreen(),
            onGenerateRoute: appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
