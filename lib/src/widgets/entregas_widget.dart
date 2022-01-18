import 'package:application_enviproduct_v01/src/models/entregas_model.dart';
import 'package:application_enviproduct_v01/src/services/entregas_service.dart';
import 'package:application_enviproduct_v01/src/widgets/entregas_card.dart';
import 'package:flutter/material.dart';

class EntregaWidget extends StatefulWidget {
  const EntregaWidget({Key? key}) : super(key: key);

  @override
  State<EntregaWidget> createState() => _EntregaWidgetState();
}

class _EntregaWidgetState extends State<EntregaWidget> {
  final EntregasAPPService _entregaService = EntregasAPPService();
  List<Entregas>? _listEntregas;

  @override

   void initState() {
    super.initState();
    _downloadContent();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: const Text("Pendientes"), 
        ) ,
      body: _listEntregas == null
        ? const Center(
            child: SizedBox(
                height: 50.0, width: 50.0, child: CircularProgressIndicator()),
          )
        : _listEntregas!.isEmpty
            ? const Center(
                child: SizedBox(child: Text('No hay entregas disponibles')),
              )
            : Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
                child: ListView(
                  children: _listEntregas!.map((e) => CardEntregas(model: e)).toList(),
                ),
              ),
      ));
  }
  _downloadContent() {
    _entregaService.getEntregas().then((value) {
      _listEntregas = value;
      setState(() {});
    });
  }
}