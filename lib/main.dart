import 'package:crypto_app/constants/themes.dart';
import 'package:crypto_app/constants/LocalStorage/localstorage.dart';
import 'package:crypto_app/pages/HomePage/homepage.dart';
import 'package:crypto_app/pages/SplashScreen/splashscreen.dart';
import 'package:crypto_app/providers/adprovder.dart';
import 'package:crypto_app/providers/marketprovider.dart';
import 'package:crypto_app/providers/themeprovider.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  String currenttheme = await LocalStorage.getTheme() ?? 'light';
  runApp(MyApp(
    theme: currenttheme,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.theme});
  final String theme;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<MarketProvider>(
                  create: (context) => MarketProvider()),
              ChangeNotifierProvider<ThemeProvider>(
                  create: (context) => ThemeProvider(theme)),
                  ChangeNotifierProvider<AdProvider>(
                  create: (context) => AdProvider()),
            ],
            child: Consumer<ThemeProvider>(
              builder: ((context, themeprovider, child) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: 'Crypto App',
                  themeMode: themeprovider.themeMode,
                  theme: lightTheme,
                  darkTheme: darkTheme,
                  home: const SplashScreen(),
                );
              }),
            ),
          );
        });
  }
}
