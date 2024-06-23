import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppingapp/Providers/cart_manager.dart';
import 'package:shoppingapp/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Lato",
          textTheme: const TextTheme(
            bodyLarge: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            bodyMedium: TextStyle(
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            titleLarge: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
            titleSmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          brightness: Brightness.light,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(35),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(35),
            ),
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold),
            prefixIconColor: Colors.grey,
          ),
        ),
        home: const Homepage(),
      ),
    );
  }
}
