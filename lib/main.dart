import 'package:final_e_commerce/provider/adminMode.dart';
import 'package:final_e_commerce/provider/modelHud.dart';
import 'package:final_e_commerce/screens/admin/addProduct.dart';
import 'package:final_e_commerce/screens/admin/admin_page.dart';
import 'package:final_e_commerce/screens/user/home_page.dart';
import 'package:final_e_commerce/screens/login_screen.dart';
import 'package:final_e_commerce/screens/signup_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Modelhud>(
          create: (context) => Modelhud(),
        ),
        ChangeNotifierProvider<AdminMode>(
          create: (context) => AdminMode(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: LoginScreen.id,
        routes: {
          // ignore: prefer_const_constructors
          LoginScreen.id: (context) => LoginScreen(),
          SignupScreen.id: (context) => SignupScreen(),
          HomePage.id: (context) => const HomePage(),
          AdminPage.id: (context) => const AdminPage(),
          AddProduct.id: (context) =>  AddProduct(),
        },
      ),
    );
  }
}
