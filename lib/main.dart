import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/utils/styles.dart';
import 'features/main_layout/presentation/views/main_layout.dart';
import 'firebase_options.dart';


void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo' ,
      theme: ThemeData(
        primarySwatch: Styles.mainColor as MaterialColor,
        scaffoldBackgroundColor: Styles.backgroundColor,
        fontFamily: 'Jannah',
        buttonTheme: const ButtonThemeData(
          buttonColor: Styles.mainColor,
        ),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Jannah',
            ),
            color: Colors.white,
            elevation: 0.0,
        ),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(primary: Styles.mainColor, secondary: Styles.mainColor),
      ),

      debugShowCheckedModeBanner: false,
      home: const MainLayout(),
    );
  }
}