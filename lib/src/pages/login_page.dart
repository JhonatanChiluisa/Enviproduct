import 'package:application_enviproduct_v01/src/bloc/login_bloc.dart';
import 'package:application_enviproduct_v01/src/pages/home_page.dart';
import 'package:application_enviproduct_v01/src/providers/main_provider.dart';
import 'package:application_enviproduct_v01/src/services/usuario_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

late bool _succes = false;
final FirebaseAuth _auth = FirebaseAuth.instance;
final TextEditingController _emailController = TextEditingController();
final TextEditingController _passwordController = TextEditingController();

class _LoginPageState extends State<LoginPage> {
  late LoginBloc bloc;
  UsuarioService usuarioService = UsuarioService();
  bool _obscureText = true;

  @override
  void initState() {
    bloc = LoginBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    final mainProvider = Provider.of<MainProvider>(context);
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Container(
        color: Theme.of(context).primaryColorDark,
        height: size.height * 0.4,
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
                  child: Text("Iniciar sesión",
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor)),
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
                            stream: bloc.emailStream,
                            builder: (BuildContext context,
                                    AsyncSnapshot snapshot) =>
                                TextField(
                                    controller: _emailController,
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
                                    controller: _passwordController,
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
                            stream: bloc.loginValidStream,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20.0),
                                child: ElevatedButton.icon(
                                    onPressed: snapshot.hasData
                                        ? () async {
                                            await _userlogin();
                                            if (_succes) {
                                              await Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const HomePage()));
                                              setState(() {});
                                            }
                                          }
                                        : null,
                                    icon: const Icon(Icons.login),
                                    label: const Text("Ingresar")),
                              );
                            })
                      ],
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("¿No tienes una cuenta?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/singUp");
                        },
                        child: const Text("Registrate")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ])));
  }

  Future<void> _userlogin() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user!;

      if (user.uid.isNotEmpty) {
        setState(() {
          _succes = true;
        });
      } else {
        _succes = false;
      }
    } catch (e) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                "Usuario no encontrado !",
                textAlign: TextAlign.center,
              ),
              content: SingleChildScrollView(
                  child: ListBody(children: const [
                Text(
                  "Verifique e intente nuevamente",
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
                            builder: (context) => const LoginPage()),
                      );
                    }),
              ],
            );
          });
    }
  }
}
