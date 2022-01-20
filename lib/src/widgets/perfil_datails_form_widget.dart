import 'package:application_enviproduct_v01/src/models/perfil_model.dart';
import 'package:application_enviproduct_v01/src/pages/crear_perfil_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PerfilDetailsFormWidget extends StatefulWidget {
  const PerfilDetailsFormWidget({Key? key}) : super(key: key);

  @override
  _PerfilDetailsFormWidgetState createState() =>
      _PerfilDetailsFormWidgetState();
}

class _PerfilDetailsFormWidgetState extends State<PerfilDetailsFormWidget> {
  final _formKey = GlobalKey<FormState>();
  late Perfil _perfil;

  final cedula = TextEditingController();
  final nombre = TextEditingController();
  final edad = TextEditingController();
  final tipolicencia = TextEditingController();
  final cooperativa = TextEditingController();
  final celular = TextEditingController();
  final direccion = TextEditingController();

  @override
  void initState() {
    super.initState();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14.0),
            child: Text(
              "Datos Personales",
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: size.width * .80,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                    width: 2.0, color: Theme.of(context).primaryColorDark)),
            child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 7.0),
                  child: Column(
                    children: [
                      TextFormField(
                        validator: (value) {
                          return _validateCedula(value!);
                        },
                        controller: cedula,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Cedula: "),
                        onSaved: (value) {
                          _perfil.cedula = value.toString();
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          return _validateNombre(value!);
                        },
                        controller: nombre,
                        keyboardType: TextInputType.text,
                        decoration:
                            const InputDecoration(labelText: "Nombre: "),
                        onSaved: (value) {
                          _perfil.nombre = value.toString();
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          return _validateEdad(value!);
                        },
                        controller: edad,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(labelText: "Edad: "),
                        onSaved: (value) {
                          _perfil.edad = value.toString();
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          return _validateLicencia(value!);
                        },
                        controller: tipolicencia,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: "Tipo de licencia: "),
                        onSaved: (value) {
                          _perfil.tipolicencia = value.toString();
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          return _validateCooperativa(value!);
                        },
                        controller: cooperativa,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            labelText: "Cooperativa de transporte: "),
                        onSaved: (value) {
                          _perfil.cooperativa = value.toString();
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          return _validateCelular(value!);
                        },
                        controller: celular,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: "Celular: "),
                        onSaved: (value) {
                          _perfil.celular = value.toString();
                        },
                      ),
                      TextFormField(
                        validator: (value) {
                          return _validateDireccion(value!);
                        },
                        controller: direccion,
                        keyboardType: TextInputType.text,
                        decoration:
                            const InputDecoration(labelText: "Dirección: "),
                        onSaved: (value) {
                          _perfil.direccion = value.toString();
                        },
                      ),
                      IconButton(
                          onPressed: () async {
                            if (!_formKey.currentState!
                                  .validate()) return;
                            setState(() {});
                            await _enviaralServidor();
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text(
                                      "Datos añadidos",
                                      textAlign: TextAlign.center,
                                    ),
                                    content: SingleChildScrollView(
                                        child: ListBody(children: const [
                                      Text(
                                        "Continue con su foto de perfil..",
                                        textAlign: TextAlign.center,
                                      ),
                                    ])),
                                    actions: [
                                      TextButton(
                                          child: const Text(
                                            "Aceptar",
                                            textAlign: TextAlign.center,
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const CrearPerfilPage()),
                                            );
                                          }),
                                    ],
                                  );
                                });
                          },
                          icon: const Icon(
                            Icons.save,
                            size: 40.0,
                          )),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  Future<void> _enviaralServidor() async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('perfil');
      await reference.add({
        "cedula": cedula.text,
        "nombre": nombre.text,
        "edad": edad.text,
        "tipodelicencia": tipolicencia.text,
        "cooperativa": cooperativa.text,
        "celular": celular.text,
        "direccion": direccion.text,
      });
    });
  }

  String? _validateCedula(String value) {
    return (value.isEmpty)
        ? "Debe ingresar su cedula"
        : null; //Validación se cumple al retorna null
  }

  String? _validateNombre(String value) {
    return (value.isEmpty)
        ? "Debe ingresar su nombre"
        : null; //Validación se cumple al retorna null
  }

  String? _validateEdad(String value) {
    return (value.isEmpty)
        ? "Debe ingresar su edad"
        : null; //Validación se cumple al retorna null
  }

  String? _validateLicencia(String value) {
    return (value.isEmpty)
        ? "Debe ingresar el tipo de Licencia"
        : null; //Validación se cumple al retorna null
  }

  String? _validateCooperativa(String value) {
    return (value.isEmpty)
        ? "Debe ingresar la comperativa o ninguna"
        : null; //Validación se cumple al retorna null
  }

  String? _validateCelular(String value) {
    return (value.isEmpty)
        ? "Debe ingresar su número celular"
        : null; //Validación se cumple al retorna null
  }

  String? _validateDireccion(String value) {
    return (value.isEmpty)
        ? "Debe ingresar su direccion de residencia"
        : null; //Validación se cumple al retorna null
  }
}
