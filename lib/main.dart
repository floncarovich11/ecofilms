import 'package:ecofilms/pages/perfil.dart';
import 'package:ecofilms/pages/pesquisa.dart';
import 'package:ecofilms/pages/player.dart';
import 'package:ecofilms/pages/reproducao.dart';
import 'package:ecofilms/pages/player.dart';
import 'package:ecofilms/shared/style.dart';
import 'package:flutter/material.dart';
import 'package:ecofilms/pages/cadastro.dart';
import 'package:ecofilms/pages/login.dart';
import 'package:ecofilms/pages/home.dart';
import 'package:ecofilms/pages/splash.dart';
import 'package:firebase_core/firebase_core.dart'; // Importa o pacote para inicializar o Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        fontFamily: MyFonts.fontPrimary,
        colorScheme: ColorScheme.fromSeed(seedColor: MyColors.verdeprincipal),
        useMaterial3: true,
      ),
      
      initialRoute: "/",
      routes: {
      '/' : (context) => Splash(),
      '/login' : (context) => Login(),
      '/cadastro' : (context) => Cadastro(),
      '/home' : (context) => Home(), 
      '/perfil' : (context) => Perfil(),  
      '/pesquisa' : (context) => Pesquisa(),
      '/reproducao' : (context) => Reproducao(), 
      '/player' : (context) => YoutubeVideoPage(),
      }
    );
  }
}