import 'package:flutter/material.dart';

class UniversalDetails extends StatelessWidget{
  final String header;
  final String title;
  final String description;
  final Widget footer;

  const UniversalDetails({
    super.key,
    required this.header,
    required this.title,
    required this.description,
    required this.footer,
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(header),),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(title, style: TextStyle(fontSize: 35),),
            ),),
          Divider(height: 15,),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Align(alignment: Alignment.center,
              child: Column(
                children: [
                  Text(description),
                  Divider(height: 10,),
                  footer
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}