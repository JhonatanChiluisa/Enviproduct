import 'package:application_enviproduct_v01/src/widgets/perfil_datails_form_widget.dart';
import 'package:application_enviproduct_v01/src/widgets/perfil_datails_foto_widget.dart';
import 'package:flutter/material.dart';

class PerfilDetailsWidget extends StatefulWidget {
  const PerfilDetailsWidget({Key? key}) : super(key: key);

  @override
  _PerfilDetailsWidgetState createState() => _PerfilDetailsWidgetState();
}

class _PerfilDetailsWidgetState extends State<PerfilDetailsWidget>
    with SingleTickerProviderStateMixin {
  final List<Tab> _myTabs = <Tab>[
    const Tab(text: 'Datos del Perfil'),
    const Tab(text: 'Foto del Perfil'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController( vsync: this, length: _myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TabBar(tabs: _myTabs, controller: _tabController, labelColor: Colors.black,),
      body: TabBarView( controller: _tabController, children: const [
        PerfilDetailsFormWidget(),
        PerfilDetailsFotoWidget()
      ]),
    );
  }
}
