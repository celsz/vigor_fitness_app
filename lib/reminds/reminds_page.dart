import 'package:flutter/material.dart';
import 'package:vigor_fitness_app/widgets/universal_details_page.dart';

class RemindsPage extends StatelessWidget{
  const RemindsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: UniversalDetails(header: 'Заблокированный контент', title: 'Упс! Данная функция недоступна!', description: 'Кажется, эта функция недоступна на вашей планете. Позже вы сможете рассмотреть список разрешённых планет', footer: TextButton(onPressed: (){}, child: Text("Список планет")),),
    );

  }
}