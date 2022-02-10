import 'package:flutter/material.dart';

class GridsView extends StatelessWidget {
  const GridsView({Key? key, this.text, this.textColor, required this.icon}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final textColor;
  // ignore: prefer_typing_uninitialized_variables
  final text;
  // ignore: prefer_typing_uninitialized_variables
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(icon, color: Colors.white, size: 45.0),
          ),
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 20),
          ),
        ],
      ),
    );
  }
}
