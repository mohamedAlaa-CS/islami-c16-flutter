import 'package:flutter/material.dart';
import 'package:islami_c16/core/cache/cach_keys.dart';
import 'package:islami_c16/core/cache/shared_pref_service.dart';
import 'package:islami_c16/ui/chapter_details/ChapterDetails.dart';
import 'package:islami_c16/ui/common/MostRecentSharedPrefences.dart';
import 'package:islami_c16/ui/design.dart';
import 'package:islami_c16/ui/home/HomeScreen.dart';
import 'package:islami_c16/ui/on_boarding/on_boarding_screen.dart';
import 'package:islami_c16/ui/providers/MostRecentProvider.dart';
import 'package:islami_c16/ui/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MostRecentSharedPreferences.init(); // wait until shared prefences being initialized
  await SharedPrefService.init();
  SharedPrefService.removeData(CachKeys.isFirstTime);
  bool isFirstTime = SharedPrefService.getBooleen(CachKeys.isFirstTime) ?? true;
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentProvider(),
      child: MyApp(isfirst: isFirstTime),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isfirst});
  final bool isfirst;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MostRecentSharedPreferences.getInstance();
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.dark,
      routes: {
        AppRoutes.HomeScreen.route: (context) => HomeScreen(),
        AppRoutes.ChapterDetails.route: (context) => ChapterDetails(),
        AppRoutes.onBoardingScreen.route: (context) => const OnBoardingScreen(),
      },
      initialRoute:
          isfirst
              ? AppRoutes.onBoardingScreen.route
              : AppRoutes.HomeScreen.route,
    );
  }
}
///! open ---> onBoarding || home screen 
