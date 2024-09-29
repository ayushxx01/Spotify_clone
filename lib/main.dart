import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rockify/core/configs/assets/app_images.dart';
import 'package:rockify/core/configs/theme/app_theme.dart';
import 'package:rockify/firebase_options.dart';
import 'package:rockify/presentation/auth/pages/signin.dart';
import 'package:rockify/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:rockify/presentation/home/pages/home.dart';
import 'package:rockify/presentation/splash/pages/splash_page.dart';
import 'package:rockify/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) => MaterialApp(
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.DarkTheme,
          themeMode: mode,
          debugShowCheckedModeBanner: false,
          home: SignInPage(),
        ),
      ),
    );
  }
}
