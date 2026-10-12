import 'package:flutter/material.dart';
import 'package:my_website/home_screen.dart';
import 'package:my_website/resume_screen.dart';
import 'package:my_website/projects_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  static TextStyle nameTextStyle = TextStyle(fontSize: 20, color: Color(0xFFCCDAD1), fontWeight: FontWeight.bold);
  static TextStyle buttonTextStyle = TextStyle(fontSize: 20, color: Color(0xFFCCDAD1));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFF231D26),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: Map.fromIterable(TargetPlatform.values, value: (_) => NoTransitionsBuilder())
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) {return buildView(context, '/');},
        'resume': (context) {return buildView(context, 'resume');},
        'projects': (context) {return buildView(context, 'projects');},
      },
    );
  }

  ///
  void changeScreen(BuildContext context, String screen) {
    Navigator.pop(context);
    Navigator.pushNamed(context, screen);
  }

  Widget buildView(BuildContext context, String screen) {
    EdgeInsets buttonInsets = const EdgeInsets.all(12);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3E2056),
          title: Text("Dillon Roper", style: nameTextStyle),
          actions: [
            InkWell(onTap: () {changeScreen(context, '/');}, child: Padding(padding: buttonInsets, child: Text('Home', style: buttonTextStyle))),
            InkWell(onTap: () {changeScreen(context, 'resume');}, child: Padding(padding: buttonInsets, child: Text('Resume', style: buttonTextStyle))),
            InkWell(onTap: () {changeScreen(context, 'projects');}, child: Padding(padding: buttonInsets, child: Text('Projects', style: buttonTextStyle))),
          ],
        ),
        body: SafeArea(
          child: Center(
            child: buildScreen(screen)
          ),
        ),
      );
  }

  ///
  Widget buildScreen(String screen) {
    switch (screen) {
      case 'resume':
        return ResumeScreen();
      case 'projects':
        return ProjectsScreen();
      default:
        return HomeScreen();
    }
  }

  
}

class NoTransitionsBuilder extends PageTransitionsBuilder {
  const NoTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T>? route,
    BuildContext? context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
