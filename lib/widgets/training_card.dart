import 'package:flutter/material.dart';

class TrainingCard extends StatelessWidget{
  final String name;
  final String type;
  final String repeats;
  final String time;

  const TrainingCard({super.key,
  required this.name,
  required this.type,
  required this.repeats,
  required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 195, 207, 207),
      child: InkWell(
        onTap: () {

        },
        child: Container(
          padding: EdgeInsets.only(left: 16, bottom: 10, top: 10),
          child: Column(
            children: [
              Text("Упражнение на "),
              Text(type, style: TextStyle(fontSize: 25),),
              Row(
                children: [
                  Text(name, style: TextStyle(fontSize: 20),),
                  VerticalDivider(width: 10,),
                  Padding(padding: EdgeInsets.only(top: 3), child: Text(repeats, style: TextStyle(fontSize: 12),),),
                  Padding(padding: EdgeInsets.only(top: 2),child: Text("раз(-а)", style: TextStyle(fontSize: 12),),),
                  Padding(padding: EdgeInsets.only(right: 10), child: Text(time),)
                ],
              )
            ],
          ),
        ),),
    );
  }
}