import 'package:application_enviproduct_v01/src/models/provedores_model.dart';
import 'package:application_enviproduct_v01/src/providers/proveedor_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProveedorFormPage extends StatefulWidget {
  const ProveedorFormPage({Key? key}) : super(key: key);

  @override
  _ProveedorFormPageState createState() => _ProveedorFormPageState();
}

class _ProveedorFormPageState extends State<ProveedorFormPage> {
  final _formKey = GlobalKey<FormState>();
  late Proveedor _model;
  bool _onSaving = false;

  //Atributos utilizados en la selección
  final List<String> _typesElement = [
    'Lacteos',
    'Cárnicos',
    'Abarrotes',
    'Vegetales',
    'Frutas'
  ];
  String _typeSelected = "Lacteos";

  @override
  void initState() {
    super.initState();
    _model = Proveedor.created();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final proveedorProvider =
        Provider.of<ProveedorProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo Proveedor"),
        centerTitle: true,
        ),
      body: SingleChildScrollView(
          child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            height: size.height * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorDark,
            ])),
          ),
          Column(
            children: [
              SizedBox.square(dimension: 120.h),
              Text("Registro de uso",
                  style: Theme.of(context).textTheme.headline5),
              Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 14.0),
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
                          DropdownButton<String>(
                            value: _typeSelected,
                            icon: const Icon(Icons.arrow_downward),
                            elevation: 16,
                            underline: Container(height: 2),
                            onChanged: (String? newValue) {
                              _model.tipo = _typesElement.indexOf(newValue!);
                              setState(() {
                                _typeSelected = newValue;
                              });
                            },
                            items: _typesElement
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          TextFormField(
                              keyboardType: TextInputType.text,
                              initialValue: _model.nombre,
                              onSaved: (value) {
                                //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
                                _model.nombre = value.toString();
                              },
                              decoration:
                                  const InputDecoration(labelText: "Nombre:")
                              ),
                          TextFormField(
                              keyboardType: TextInputType.text,
                              initialValue: _model.localizacion,
                              onSaved: (value) {
                                //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
                                _model.localizacion = value.toString();
                              },
                              decoration: const InputDecoration(
                                  labelText: "Localización:")
                              ),
                          TextFormField(
                              keyboardType: TextInputType.text,
                              initialValue: _model.contacto,
                              onSaved: (value) {
                                //Este evento se ejecuta cuando se cumple la validación y cambia el estado del Form
                                _model.contacto = value.toString();
                              },
                              decoration: const InputDecoration(
                                  labelText: "Contacto:")
                              ),
                          _onSaving
                              ? const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 20.0),
                                  child: CircularProgressIndicator())
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Tooltip(
                                    message: "Registrar insumo utilizado",
                                    child: IconButton(
                                        onPressed: () async {
                                          if (!_formKey.currentState!
                                              .validate()) return;
                                          _onSaving = true;
                                          setState(() {});

                                          //Vincula el valor de las controles del formulario a los atributos del modelo
                                          _formKey.currentState!.save();

                                          _model = await proveedorProvider
                                              .addElement(_model);
                                          if (_model.id != null) {
                                            Navigator.pop(context);
                                          }
                                        },
                                      
                                        icon: const Icon(Icons.save, size: 40.0,)),
                                  ),
                                )
                        ],
                      ),
                    )),
              )
            ],
          ),
        ],
      )),
    );
  }
  /*String? _validateNombre(String value) {
    return (value.length < 5)
        ? "Debe ingresar un nombre con al menos 15 caracteres"
        : null; //Validación se cumple al retorna null
  }

  String? _validateLocalizacion(String value) {
    return (value.length < 15)
        ? "Debe ingresar una localizacion con al menos 30 caracteres"
        : null; //Validación se cumple al retorna null
  }

  String? _validateContacto(String value) {
    return (value.length < 10)
        ? "Debe ingresar datos de contacto de al menos 30 caracteres"
        : null; //Validación se cumple al retorna null
  }*/
}
