import 'package:e_commerce/providers/auth_provider.dart';
import 'package:e_commerce/providers/cart_provider.dart';
import 'package:e_commerce/providers/product_provider.dart';
import 'package:e_commerce/splash_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'network/network_service.dart';

final apiService = NetworkApiService();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US')],
    path: 'assets/languages',
    fallbackLocale: const Locale('en', 'US'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider())
      ],
      child: MaterialApp(
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        builder: (context, child) {
          final mediaQuery = MediaQuery.of(context);
          return MediaQuery(
              data: mediaQuery.copyWith(textScaleFactor: 1), child: child!);
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(), //splash
      ),
    );
  }
}
