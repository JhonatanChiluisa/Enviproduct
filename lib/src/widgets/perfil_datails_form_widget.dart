import 'package:flutter/material.dart';

class PerfilDetailsFormWidget extends StatefulWidget {
  const PerfilDetailsFormWidget({Key? key}) : super(key: key);

  @override
  _PerfilDetailsFormWidgetState createState() =>
      _PerfilDetailsFormWidgetState();
}

class _PerfilDetailsFormWidgetState extends State<PerfilDetailsFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
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
                        decoration: const InputDecoration(
                            labelText: "Cedula: "),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Nombre: "),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Edad: "),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Tipo de licencia: "),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Cooperativa de transporte: "),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Celular: "),
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            labelText: "Dirección: "),
                      ),
                      ElevatedButton(
                          onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Procesando los Datos')),
                            );
                          }
                        },
                        child: const Icon(Icons.save, size: 35.0,)
                      ),
                      ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
