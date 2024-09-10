import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'Core/Constant/color_app.dart';
import 'Data/Customs/firebase_options.dart';
import 'Pages/Home/home_page.dart';
import 'Pages/Start/start_page.dart';
import 'cubit/AzkaarCubit/azkaar_cubit.dart';
import 'cubit/QuraanCubit/quraan_cubit.dart';
import 'cubit/audio_quraan_cubit.dart';
import 'cubit/boolvisibility_cubit.dart';
import 'cubit/bottom_navigation_bar_cubit.dart';
import 'cubit/last_read_cubit.dart';
import 'cubit/prayertimes_cubit.dart';
import 'cubit/username_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb &&
      (Platform.isAndroid ||
          Platform.isIOS ||
          Platform.isLinux ||
          Platform.isMacOS ||
          Platform.isWindows)) {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
  }

  await Hive.openBox('userBox');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const QuranApp(),
  ));
}

class QuranApp extends StatelessWidget {
  const QuranApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LastReadCubit(),
        ),
        BlocProvider(
          create: (context) => QuraanCubit()..getQuraanData(),
        ),
        BlocProvider(
          create: (context) => UsernameCubit(),
        ),
        BlocProvider(
          create: (context) => BoolvisibilityCubit()..taggel(),
        ),
        BlocProvider(
          create: (context) => AudioCubit(),
        ),
        BlocProvider(
          create: (context) => BottomNavigationBarCubit(initialIndex: NavigtionBarItem.quraan),
        ),
        BlocProvider(
          create: (context) => AzkaarCubit()..getAzkaar(),
        ),
        BlocProvider(
          create: (context) => PrayerTimesCubit(),
        )
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Qura’n',
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: ColorApp.lightPink,
          appBarTheme: const AppBarTheme(backgroundColor: ColorApp.lightPink),
        ),
        home: const AuthenticationWrapper(),
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          final User? user = snapshot.data;
          if (user == null) {
            print('User is currently signed out!');
            return const StartPage();
          } else {
            print('User is signed in!');

            return HomePage();
          }
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: ColorApp.lightPink,
              ),
            ),
          );
        }
      },
    );
  }
}
