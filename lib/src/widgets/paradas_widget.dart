import 'package:application_enviproduct_v01/src/models/stop_model.dart';
import 'package:application_enviproduct_v01/src/services/stop_service.dart';
import 'package:application_enviproduct_v01/src/widgets/stop_card.dart';
import 'package:flutter/material.dart';

class ParadasWidget extends StatefulWidget {
  const ParadasWidget({Key? key}) : super(key: key);

  @override
  State<ParadasWidget> createState() => _ParadasWidgetState();
}

class _ParadasWidgetState extends State<ParadasWidget> {
  final StopService _stopservice = StopService();
  List<Paradas>? _listStop;

  @override
  void initState() {
    super.initState();
    _downloadContent();
  }

  @override
  Widget build(BuildContext context) {
    return _listStop == null
        ? const Center(
            child: SizedBox(
                height: 50.0, width: 50.0, child: CircularProgressIndicator()),
          )
        : _listStop!.isEmpty
            ? const Center(
                child: SizedBox(child: Text('No hay paradas disponibles')),
              )
            : Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
                child: ListView(
                  children: _listStop!.map((e) => StopCard(model: e)).toList(),
                ),
              );
  }

  _downloadContent() async {
    _listStop = await _stopservice.getStop();
    if (mounted){
      setState(() {});
    }
  }
}
