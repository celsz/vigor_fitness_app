import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vigor_fitness_app/funcs/preferences_funcs_trainings.dart';

class AddTrainingPage extends StatefulWidget{
  const AddTrainingPage({super.key});

  @override
  State<AddTrainingPage> createState() => _AddTrainingState();

}

class _AddTrainingState extends State<AddTrainingPage>{
  final _nameController = TextEditingController();
  final _typeController = TextEditingController();
  final _repeatsController = TextEditingController();

  void _submit(){
    if (_nameController.text.isEmpty || _typeController.text.isEmpty || _repeatsController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Поля не должны быть пустыми')));
      return;
    }

    try{
      PreferenceSaver.saveNewTraining(_nameController.text, _typeController.text, _repeatsController.text);
      Navigator.pop(context);
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('ERROR $e')));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Добавьте тренировку"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Введите название"),
            TextField(controller: _nameController, decoration: const InputDecoration(labelText: ">>>"),),
            Text("Введите группу мышц"),
            TextField(controller: _typeController, decoration: const InputDecoration(labelText: ">>>"),),
            Text("Введите количество повторов"),
            TextField(controller: _repeatsController, decoration: const InputDecoration(labelText: ">>>"),),
            ElevatedButton(
                onPressed: _submit,
                child: Text("Добавить"))
          ],
        ),
      ),
    );
  }
}