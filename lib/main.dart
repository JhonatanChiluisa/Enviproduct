
import 'package:application_enviproduct_v01/src/pages/home_page.dart';
import 'package:application_enviproduct_v01/src/providers/main_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MainProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return FutureBuilder<bool>(
        future: mainProvider.getPreferences(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ScreenUtilInit(
              designSize: const Size(360, 690),
              builder: () => MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                theme: ThemeData(brightness: mainProvider.mode == true ? Brightness.light: Brightness.dark, primarySwatch: Colors.green),
                home: const HomePage(),
              ),
            );
          }
           return const SizedBox.square(
              dimension: 100.0, child: CircularProgressIndicator());
        });
  }
}
