import 'dart:io';
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
  final ImagePicker _picker = ImagePicker();
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
              "Cree su foto de perfil",
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
                            dimension: 150.h,
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
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
                                onPressed: () => _selectImage(ImageSource.camera),
                                icon: const Icon(
                                  Icons.camera,
                                  size: 40.0,
                                )),
                            IconButton(
                                onPressed: () => _selectImage(ImageSource.gallery),
                                icon: const Icon(Icons.image, size: 40.0)),
                            IconButton(
                                onPressed: () {},
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
    XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      _imagenPerfil = File(pickedFile.path);
    } else {
      _imagenPerfil = null;
    }
    setState(() {});
  }
}
