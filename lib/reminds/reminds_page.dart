import 'package:flutter/material.dart';
import 'package:vigor_fitness_app/widgets/universal_details_page.dart';

class RemindsPage extends StatelessWidget{
  const RemindsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(child: Text("Нет напоминаний", style: TextStyle(fontSize: 25),),),
    );

  }
}