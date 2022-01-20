import 'dart:io';
import 'package:application_enviproduct_v01/src/pages/home_page.dart';
import 'package:application_enviproduct_v01/src/services/foto_perfil.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class PerfilDetailsFotoWidget extends StatefulWidget {
  const PerfilDetailsFotoWidget({Key? key}) : super(key: key);

  @override
  _PerfilDetailsFotoWidgetState createState() =>
      _PerfilDetailsFotoWidgetState();
}

class _PerfilDetailsFotoWidgetState extends State<PerfilDetailsFotoWidget> {
  final _formKey = GlobalKey<FormState>();
  File? _imagenPerfil;
  String? _urlString;
  final FotoPerfilService _fotosService = FotoPerfilService();
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
              "Selecionar foto",
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
                      Stack(
                        children: [
                          SizedBox.square(
                            dimension: 200.h,
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: _imagenPerfil == null
                                  ? Image.asset(
                                      "assets/images/imagen_Perfil.jpg")
                                  : Image.file(_imagenPerfil!),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () =>
                                    _selectImage(ImageSource.camera),
                                icon: const Icon(
                                  Icons.camera,
                                  size: 40.0,
                                )),
                            IconButton(
                                onPressed: () =>
                                    _selectImage(ImageSource.gallery),
                                icon: const Icon(Icons.image, size: 40.0)),
                            IconButton(
                                onPressed: () async {
                                  await _enviaralservidor();
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: const Text(
                                            "Foto añadida",
                                            textAlign: TextAlign.center,
                                          ),
                                          content: SingleChildScrollView(
                                              child: ListBody(children: const [
                                            Text(
                                              "Perfil completado exitosamente !!",
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
                                                            const HomePage()),
                                                  );
                                                }),
                                          ],
                                        );
                                      });
                                },
                                icon: const Icon(Icons.save, size: 40.0)),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }

  Future _selectImage(ImageSource source) async {
    final imageCamera = await ImagePicker().pickImage(source: source);
    if (imageCamera == null) return;
    final imageTemporary = File(imageCamera.path);
    _imagenPerfil = imageTemporary;
    if (_imagenPerfil != null) {
      _urlString = await _fotosService.uploadImage(_imagenPerfil!);
    }
    setState(() {});
  }

  Future<void> _enviaralservidor() async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference =
          FirebaseFirestore.instance.collection('fotoperfil');
      await reference.add({
        "url": _urlString,
      });
    });
  }
}
