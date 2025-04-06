import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

// Import Pages
import 'pages/home_page.dart';
import 'pages/chatbot_page.dart';
import 'pages/search_page.dart';
import 'pages/DonationFormPage.dart';
import 'pages/more_genres_page.dart';
import 'pages/profile_page.dart';
import 'pages/settings_page.dart';
import 'providers/theme_provider.dart';
import 'pages/Signinpage.dart';
import 'pages/LoginPage.dart';
import 'pages/SignupPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization for Web and Mobile
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyCM93MqbupJTzOY69qEQX92khjV-S7RdAw",
        appId: "1:316237683608:web:01875544f7d0b5e49a69ed",
        messagingSenderId: "316237683608",
        projectId: "hack-bodhi",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  // Load theme preference
  final prefs = await SharedPreferences.getInstance();
  bool isDarkMode = prefs.getBool('isDarkMode') ?? false;

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(isDarkMode),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'Your App',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/search': (context) => const SearchPage(),
        '/chatbot': (context) => const ChatbotPage(),
        '/donation': (context) => const DonationFormPage(),
        '/more-genres': (context) => const MoreGenresPage(),
        '/profile': (context) => const ProfilePage(),
        '/settings': (context) => const SettingsPage(),
        '/signin': (context) => const SigninPage(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
      },
    );
  }
}
