import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:my_food_app/screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:my_food_app/screens/sign_in_screen/models/sign_in_model.dart';

import 'core/app_export.dart';

var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyDnH8xJtvnAj-8a1BZq93mTKj1oLwV_gEo',
          appId: '1:128035627461:android:694e954fb9b7277a73ebac',
          messagingSenderId: '128035627461',
          storageBucket: "my-flutter-food-app.appspot.com",
          projectId: 'my-flutter-food-app'));

  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
  ]).then((value) {
    PrefUtils().init();
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ThemeBloc(
                ThemeState(
                  themeType: PrefUtils().getThemeData(),
                ),
              ),
            ),
            BlocProvider(
              create: (context) => SignInBloc(
                SignInState(
                  signInModelObj: const SignInModel(),
                ),
              )..add(SignInInitialEvent()),
            ),
          ],
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return MaterialApp(
                title: 'muhammad_s_application',
                navigatorKey: NavigatorService.navigatorKey,
                debugShowCheckedModeBanner: false,
                localizationsDelegates: const [
                  AppLocalizationDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en'),
                ],
                initialRoute: AppRoutes.initialRoute,
                routes: AppRoutes.routes,
              );
            },
          ),
        );
      },
    );
  }
}







// import 'package:flutter/material.dart';
// import 'package:my_food_app/screens/welcom_screen/welcome_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const WelcomeScreen(), // Set the main screen as the home
//     );
//   }
// }
