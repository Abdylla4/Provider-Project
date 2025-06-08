import 'package:atm_provider/atm_with_provider/atm_with_provider/home_page.dart';
import 'package:atm_provider/atm_with_provider/atm_with_provider/view_model/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => AuthProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
