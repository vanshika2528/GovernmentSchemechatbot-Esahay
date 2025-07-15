import 'package:esahay/screen/login.dart';
import 'screen/chatbot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'screen/splashscreen.dart';

// import 'screen/category.dart';
void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'OneStop',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 255, 255, 255)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/chat', page: () => ChatbotScreen()),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
