import 'package:flutter/material.dart';
import 'package:vigor_fitness_app/funcs/preferences_funcs_trainings.dart';
import 'package:vigor_fitness_app/trains/add_entry.dart';
import 'package:vigor_fitness_app/widgets/training_card.dart';

class TrainingsPage extends StatefulWidget{
  const TrainingsPage({super.key});

  @override
  State<TrainingsPage> createState() => _TrainingsPageState();

}

class _TrainingsPageState extends State<TrainingsPage>{
  late int _len = 0;
  late List<dynamic> _trainsFinal;


  @override
  void initState() {
    super.initState();
    PreferenceSaver.resetAllData();
    _refresh();

  }

  Future<void> _refresh() async{
    Future<List<dynamic>> trainsFut = PreferenceSaver.getTrainings();
    trainsFut.then((list) => _len = list.length);
    trainsFut.then((list) => _trainsFinal = list);
    setState(() {});
  }


  @override
  Widget build(BuildContext context){
    return RefreshIndicator(
        onRefresh: _refresh,
        child: Scaffold(appBar: AppBar(title: Text("Тренировки"),),
          floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => AddTrainingPage()));
          },
          child: Icon(Icons.add),

        ),
          body: ListView.builder(
            itemCount: _len,
            itemBuilder: (BuildContext context, int index) {
              return TrainingCard(name: PreferenceSaver.getName(_trainsFinal[index]),
                  type: PreferenceSaver.getType(_trainsFinal[index]),
                  repeats: PreferenceSaver.getRepeats(_trainsFinal[index]),
                  time: PreferenceSaver.getTime(_trainsFinal[index]));
            },

          ),
        ));
  }
}