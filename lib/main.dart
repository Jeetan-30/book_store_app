import 'package:bookstore/page/spalash_screen.dart';
import 'package:bookstore/page/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'manager/manage_state.dart';
void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ManageState()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}