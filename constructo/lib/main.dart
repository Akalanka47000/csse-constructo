import 'dart:io';
import 'package:constructo/screens/auth/login.dart';
import 'package:constructo/state/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:constructo/config/firebase_options.dart';
import 'package:constructo/config/secrets.dart';
import 'package:constructo/config/themes/themes.dart';
import 'package:constructo/routes/routes.dart';
import 'package:constructo/state/ui/global/global_bloc.dart';
import 'package:constructo/utils/app_http_overrides.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  Paint.enableDithering = true;
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  if (Secrets.appEnv == "local") {
    HttpOverrides.global = AppHttpOverrides();
    await dotenv.load(fileName: ".env");
  }
  Secrets.load();
  if (DefaultFirebaseOptions.currentPlatform != null && Firebase.apps.isEmpty) {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Phoenix(
      child: MultiBlocProvider(
        providers: rootBlocProviders,
        child: BlocBuilder<GlobalBloc, GlobalState>(
          builder: (context, state) {
            return MaterialApp(
              title: "Constructo",
              debugShowCheckedModeBanner: false,
              theme: Themes.list[state.theme],
              locale: Locale(state.locale),
              onGenerateRoute: Routes.onGenerateRoute,
              home: Login(),
            );
          },
        ),
      ),
    );
  }
}
