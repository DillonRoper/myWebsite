import 'package:flutter/material.dart';
import 'package:my_website/home_screen.dart';
import 'package:my_website/resume_screen.dart';
import 'package:my_website/projects_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle nameTextStyle = TextStyle();
    const TextStyle buttonTextStyle = TextStyle();
    

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.windows: NoTransitionsBuilder(),
            TargetPlatform.android: NoTransitionsBuilder(),
            TargetPlatform.iOS: NoTransitionsBuilder(),
          },
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
    return Scaffold(
        appBar: AppBar(
          title: Text("Dillon Roper"),
          actions: [
            ElevatedButton(onPressed: () {changeScreen(context, '/');}, child: Text('Home')),
            ElevatedButton(onPressed: () {changeScreen(context, 'resume');}, child: Text('Résumé')),
            ElevatedButton(onPressed: () {changeScreen(context, 'projects');}, child: Text('Projects')),
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
