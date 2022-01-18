import 'package:flutter/material.dart';

class CalendarioWidget extends StatelessWidget {
  const CalendarioWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Calendario"),
          centerTitle: true,
          ),
        body: const Center(
          child: Icon(Icons.calendar_today, size: 80.0,)
        ),
      ));
  }
}