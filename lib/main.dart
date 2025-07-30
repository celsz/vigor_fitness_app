import 'package:flutter/material.dart';
import 'package:vigor_fitness_app/reminds/reminds_page.dart';
import 'package:vigor_fitness_app/summary/summary_page.dart';
import 'package:vigor_fitness_app/trains/trains_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Useless',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

      ),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(title: 'Vigor'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _current_screen = 0;
  final List<Widget> _screens = [
    SummaryPage(),
    TrainingsPage(),
    RemindsPage()
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _screens[_current_screen],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.accessibility_new_rounded), label: "Обзор"),
        BottomNavigationBarItem(icon: Icon(Icons.alarm_on_outlined), label: "Тренировки"),
        BottomNavigationBarItem(icon: Icon(Icons.assignment), label: "План"),
      ], currentIndex: _current_screen,
      onTap: (v){
        setState(() {
          _current_screen = v;
        });
      },),
    );
  }
}
