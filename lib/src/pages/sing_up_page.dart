import 'package:application_enviproduct_v01/src/bloc/singup_bloc.dart';
import 'package:application_enviproduct_v01/src/pages/login_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({Key? key}) : super(key: key);

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

// ignore: unused_element
late bool? _success;
// ignore: unused_element
late String _userEmail = '';
late String us = "";

class _SingUpPageState extends State<SingUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late SignUpBloc bloc;
  bool _obscureText = true;
  final displayname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  void initState() {
    bloc = SignUpBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(
        height: size.height * 0.4,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Theme.of(context).primaryColor,
              Colors.tealAccent,
              Colors.greenAccent,
              Colors.teal
            ])),
      ),
      SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: size.width * .80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SafeArea(child: Container(height: 120.h)),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Text("Registro de usuario",
                      style: Theme.of(context).textTheme.headline4!),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 4.0, vertical: 14.0),
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    width: size.width * .80,
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                            width: 2.0,
                            color: Theme.of(context).primaryColorDark)),
                    child: Column(
                      children: [
                        StreamBuilder(
                            stream: bloc.usernameStream,
                            builder: (BuildContext context,
                                    AsyncSnapshot snapshot) =>
                                TextField(
                                    controller: displayname,
                                    keyboardType: TextInputType.text,
                                    onChanged: bloc.changeUsername,
                                    decoration: InputDecoration(
                                        errorText: snapshot.error?.toString(),
                                        icon: const Icon(Icons.account_circle),
                                        labelText: 'Nombre'))),
                        StreamBuilder(
                            stream: bloc.emailStream,
                            builder: (BuildContext context,
                                    AsyncSnapshot snapshot) =>
                                TextField(
                                    controller: email,
                                    keyboardType: TextInputType.emailAddress,
                                    onChanged: bloc.changeEmail,
                                    decoration: InputDecoration(
                                        errorText: snapshot.error?.toString(),
                                        icon: const Icon(Icons.email),
                                        hintText: 'usuario@enviproducts.org',
                                        labelText: 'Correo electrónico'))),
                        StreamBuilder(
                            stream: bloc.passwordStream,
                            builder: (BuildContext context,
                                    AsyncSnapshot snapshot) =>
                                TextField(
                                    controller: password,
                                    onChanged: bloc.changePassword,
                                    obscureText: _obscureText,
                                    decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                          onPressed: () {
                                            _obscureText = !_obscureText;
                                            setState(() {});
                                          },
                                          icon: _obscureText
                                              ? const Icon(Icons.visibility)
                                              : const Icon(
                                                  Icons.visibility_off)),
                                      errorText: snapshot.error?.toString(),
                                      icon: const Icon(Icons.lock),
                                      labelText: 'Contraseña',
                                    ))),
                        StreamBuilder(
                            stream: bloc.signUpValidStream,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: ElevatedButton.icon(
                                    onPressed: () async {
                                      await _registerintheDDB();
                                      if (_success = true) {
                                        await Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginPage()));
                                        setState(() {});
                                      }
                                    },
                                    icon: const Icon(Icons.person_add),
                                    label: const Text("Registrar")),
                              );
                            })
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    ])));
  }

  Future<void> _sentoserver() async {
    FirebaseFirestore.instance.runTransaction((Transaction transaction) async {
      CollectionReference reference;
      reference = FirebaseFirestore.instance.collection('usuarios');
      await reference.add({
        "uid": us,
        "email": email.text,
        "password": password.text,
        "displayname": displayname.text
      });
    });
  }

  Future<void> _registerintheDDB() async {
    final User? user = (await _auth.createUserWithEmailAndPassword(
      email: email.text,
      password: password.text,
    ))
        .user;
    us = user!.uid;
    // ignore: unnecessary_null_comparison
    if (user != null) {
      await _sentoserver();

      setState(() {
        _success = true;
        _userEmail = user.email ?? '';
      });
    } else {
      _success = false;
    }
  }
}
