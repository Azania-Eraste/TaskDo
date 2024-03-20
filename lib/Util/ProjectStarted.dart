import 'package:azaproject/Util/CalendarState.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProjectStarted extends StatefulWidget {
  final String? subtitle;
  final String title;
  final String Date;
  ProjectStarted(
      {super.key, this.subtitle, required this.title, required this.Date});

  @override
  State<ProjectStarted> createState() => _ProjectStartedState();
}

class _ProjectStartedState extends State<ProjectStarted> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            color: couleur.SecondaryColors,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 28, 20, 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.subtitle!,
                    style:
                        TextStyle(color: couleur.primarycolors, fontSize: 15),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                        color: couleur.primarycolors,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.Date,
                    style: TextStyle(color: couleur.primarycolors),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
