import 'package:azaproject/Util/CalendarState.dart';
import 'package:flutter/material.dart';

class Day_details extends StatefulWidget {
  final DateTime? date;
  final List<dynamic>? appointments;
  const Day_details({super.key, required this.date, required this.appointments});

  @override
  State<Day_details> createState() => _Day_detailsState();
}

class _Day_detailsState extends State<Day_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: couleur.Screen,
      appBar: AppBar(
        title: Text('${widget.date!.day}'),
      ),
      body: Column(
        children: [
          Center(
            child: Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Container();
                },
                itemCount: widget.appointments!.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
