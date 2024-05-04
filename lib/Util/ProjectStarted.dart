import 'package:azaproject/Util/CalendarState.dart';
import 'package:azaproject/Util/Fonts.dart';
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
  late AnimationController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        decoration: BoxDecoration(
            color: couleur.SecondaryColors,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 7, 16, 7),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    widget.subtitle!,
                    style: Fonts.regularPrimary,
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    widget.title,
                    style: Fonts.boldPrimaryMid,
                  )
                ],
              ),
              SizedBox(
                height: 10,
                width: 30,
                child: LinearProgressIndicator(
                  value: 70,
                ),
              ),
              Row(
                children: [
                  Text(
                    widget.Date,
                    style: Fonts.regularPrimary,
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
