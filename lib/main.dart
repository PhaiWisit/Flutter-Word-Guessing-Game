import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:word_test/screens/home_screen/home_screen.dart';
import 'package:word_test/utils/app_router.dart';
import 'package:word_test/utils/app_theme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'blocs/blocs_export.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  InitializationSettings initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings('@mipmap/ic_launcher'),
    // iOS: IOSInitializationSettings(),
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  // await initNotifications();
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // await initFcm();

  HydratedBlocOverrides.runZoned(
    () => runApp(
      MyApp(
        appRouter: AppRouter(),
      ),
    ),
    storage: storage,
  );
}

Future<void> initNotifications() async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Initialize platform-specific settings here if needed
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> requestNotificationPermissions() async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Request permissions
  final bool isNotificationPermissionGranted =
      await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  IOSFlutterLocalNotificationsPlugin>()
              ?.requestPermissions(
                alert: true,
                badge: true,
                sound: true,
              ) ??
          false;

  print('Notification permission granted: $isNotificationPermissionGranted');
}

class MyApp extends StatefulWidget {
  final AppRouter appRouter;
  const MyApp({super.key, required this.appRouter});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    requestNotificationPermissions();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppBlocBloc()),
        BlocProvider(create: (context) => SettingBloc()),
        BlocProvider(create: (context) => LevelBloc()),
        BlocProvider(create: (context) => QuizBloc()),
        BlocProvider(create: (context) => VocabBloc()),
        BlocProvider(create: (context) => PlayBloc()),
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
            title: 'ศัพท์สน',
            debugShowCheckedModeBanner: false,
            theme: themeData,
            home: const HomeScreen(),
            onGenerateRoute: widget.appRouter.onGenerateRoute,
          );
        },
      ),
    );
  }
}
