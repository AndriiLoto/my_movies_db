import 'package:flutter/material.dart';
import 'package:my_movies_db/widgets/auth/auth_widget.dart';
import 'package:my_movies_db/widgets/home/home_screen_widget.dart';
import 'package:my_movies_db/widgets/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromRGBO(
            3,
            37,
            65,
            1,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(
            3,
            37,
            65,
            1,
          ),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
      routes: {
        '/': (context) => const AuthWidget(),
        'home_screen': (context) => const HomeScreenWidget(),
        'main_page': (context) => const MainPage()
      },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(builder: (context) {
          return const Scaffold(
            body: Center(
              child: Text('Navigation Error'),
            ),
          );
        });
      },
    );
  }
}
