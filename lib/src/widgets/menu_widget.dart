import 'package:application_enviproduct_v01/src/models/gridview.dart';
import 'package:application_enviproduct_v01/src/pages/crear_perfil_page.dart';
import 'package:application_enviproduct_v01/src/pages/velocimetro_page.dart';
import 'package:application_enviproduct_v01/src/widgets/calendario_widget.dart';
import 'package:application_enviproduct_v01/src/widgets/entregas_widget.dart';
import 'package:application_enviproduct_v01/src/widgets/mapa_widget.dart';
import 'package:application_enviproduct_v01/src/widgets/proveedor_list_widget.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  List<String> simpleList = [
    'Crear Perfil',
    'Mapa',
    'Calendario',
    'Velocímetro',
    'Entregas',
    'Proveedores'
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Center(
            child: Padding(
              padding:
              const EdgeInsets.only(top: 80, right: 15, left: 15, bottom: 0),
              child: GridView.builder(

                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: simpleList.length,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const CrearPerfilPage();
                          },
                        ));
                      },
                      child: Container(
                        color: Colors.blue,
                        child: Center(
                            child: GridsView(
                              icon: Icons.account_circle_rounded,
                              textColor: Colors.white,
                              text: simpleList[index],
                            )),
                      ),
                    );
                  } else if (index == 1) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const MapaWidget();
                            },
                          ),
                        );
                      },
                      child: Container(
                        color: Colors.indigo,
                        child: Center(
                            child: GridsView(
                              textColor: Colors.white,
                              text: simpleList[index],
                              icon: Icons.map_sharp,
                            )),
                      ),
                    );
                  }
                  if (index == 2) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const CalendarioWidget();
                          },
                        ));
                      },
                      child: Container(
                        color: Colors.deepPurple,
                        child: Center(
                            child: GridsView(
                              textColor: Colors.white,
                              text: simpleList[index],
                              icon: Icons.calendar_today_rounded,
                            )),
                      ),
                    );
                  }
                  if (index == 3) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const VelocimetroPage();
                          },
                        ));
                      },
                      child: Container(
                        color: Colors.green,
                        child: Center(
                            child: GridsView(
                              textColor: Colors.white,
                              text: simpleList[index],
                              icon: Icons.speed_rounded,
                            )),
                      ),
                    );
                  }
                  if (index == 4) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const EntregaWidget();
                          },
                        ));
                      },
                      child: Container(
                        color: Colors.red,
                        child: Center(
                            child: GridsView(
                              textColor: Colors.white,
                              text: simpleList[index],
                              icon: Icons.assignment_late_sharp,
                            )),
                      ),
                    );
                  }
                  if (index == 5) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return const ProveedorListWidget();
                          },
                        ));
                      },
                      child: Container(
                        color: Colors.deepPurpleAccent,
                        child: Center(
                            child: GridsView(
                              textColor: Colors.white,
                              text: simpleList[index],
                              icon: Icons.business_rounded,
                            )),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ) )));
  }
}
