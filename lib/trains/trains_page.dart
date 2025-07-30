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
    _refresh();

  }

  Future<void> _refresh() async{
    setState(() {
      Future<List<dynamic>> trainsFut = PreferenceSaver.getTrainings();
      trainsFut.then((list) => _len = list.length);
      trainsFut.then((list) => _trainsFinal = list);
    });
  }


  @override
  Widget build(BuildContext context){
    return RefreshIndicator(
        onRefresh: _refresh,
        child: Scaffold(
          appBar: AppBar(title: Text("Тренировки"),
            actions: [IconButton(onPressed: (){PreferenceSaver.resetAllData(); _refresh();}, icon: Icon(Icons.delete_forever))],),

          floatingActionButton: FloatingActionButton(
          onPressed: () async{
            await Navigator.push(context, MaterialPageRoute(builder: (_) => AddTrainingPage()));
            _refresh();
          },
          child: Icon(Icons.add),

        ),
          body: FutureBuilder<List<dynamic>>(
            future: PreferenceSaver.getTrainings(),
            builder: (BuildContext context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const Center(child: CircularProgressIndicator(),);
              }

              if (snapshot.hasError){
                return Center(child: Text("ERROR ${snapshot.error}"),);
              }

              final trains = snapshot.data ?? [];
              if(trains.isEmpty){
                return const Center(child: Text("Нет упражнений"),);
              }
              return ListView.builder(
                itemCount: _len,
                itemBuilder: (BuildContext context, int index) {
                  return TrainingCard(name: PreferenceSaver.getName(_trainsFinal[index]),
                      type: PreferenceSaver.getType(_trainsFinal[index]),
                      repeats: PreferenceSaver.getRepeats(_trainsFinal[index]),
                      time: PreferenceSaver.getTime(_trainsFinal[index]));
                },

              );

            },
          ),
        ));
  }
}




// import 'package:flutter/material.dart';
// import 'package:vigor_fitness_app/funcs/preferences_funcs_trainings.dart';
// import 'package:vigor_fitness_app/trains/add_entry.dart';
// import 'package:vigor_fitness_app/widgets/training_card.dart';
//
// class TrainingsPage extends StatefulWidget {
//   const TrainingsPage({super.key});
//
//   @override
//   State<TrainingsPage> createState() => _TrainingsPageState();
// }
//
// class _TrainingsPageState extends State<TrainingsPage> {
//   late Future<List<dynamic>> _trainsFuture;
//
//   @override
//   void initState() {
//     super.initState();
//     _trainsFuture = _loadTrains();
//   }
//
//   Future<List<dynamic>> _loadTrains() async {
//     return PreferenceSaver.getTrainings();
//   }
//
//   Future<void> _refresh() async {
//     setState(() {
//       _trainsFuture = _loadTrains();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Тренировки"),
//         actions: [
//           IconButton(
//             onPressed: () {PreferenceSaver.resetAllData(); _refresh();},
//             icon: const Icon(Icons.delete_forever),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           // Ждем возврата с экрана добавления и обновляем данные
//           await Navigator.push(
//             context,
//             MaterialPageRoute(builder: (_) => const AddTrainingPage()),
//           );
//           _refresh(); // Важное изменение: обновляем после создания
//         },
//         child: const Icon(Icons.add),
//       ),
//       body: RefreshIndicator(
//         onRefresh: _refresh,
//         child: FutureBuilder<List<dynamic>>(
//           future: _trainsFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             }
//
//             if (snapshot.hasError) {
//               return Center(child: Text('Ошибка: ${snapshot.error}'));
//             }
//
//             final trains = snapshot.data ?? [];
//             if (trains.isEmpty) {
//               return const Center(child: Text('Нет тренировок'));
//             }
//
//             return ListView.builder(
//               itemCount: trains.length,
//               itemBuilder: (context, index) {
//                 return TrainingCard(
//                   name: PreferenceSaver.getName(trains[index]),
//                   type: PreferenceSaver.getType(trains[index]),
//                   repeats: PreferenceSaver.getRepeats(trains[index]),
//                   time: PreferenceSaver.getTime(trains[index]),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }