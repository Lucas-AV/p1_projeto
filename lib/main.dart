import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:math';
import 'mobile.dart';
import 'login_page.dart';
import 'dart:io';
import 'desktop.dart';
import 'package:desktop_window/desktop_window.dart';

// ignore_for_file: prefer_const_constructors
String alertMsg = "ATENÇÃO: Mantenha a calma e siga imediatamente as orientações de evacuação. Dirija-se a saída de emergência mais próxima evitando o uso de elevadores, não retorne ao edifício até receber autorização das autoridades competentes, priorize a sua segurança e a dos demais.";

String getMode(Aviso aviso){
  for(String i in gradients.keys) {
    if (aviso.title.contains(i)) {
      return i;
    }
  }
  return "";
}

Map<String,List<Color>> gradients = {
  "incêndio":[
    Colors.deepOrange,
    Colors.red,
    Colors.redAccent,
  ],
  "luz":[
    Colors.black,
    Color(0xFF222222),
  ],
  "água":[
    Colors.blueAccent,
    Colors.blue,
    Colors.lightBlue,
    Colors.lightBlueAccent,
  ],
};

class Aviso {
  String title;
  String details;
  IconData icon;
  Aviso(this.title,this.details,this.icon);
}

class Alerta extends Aviso {
  String mode;
  Alerta(String title, String details, IconData icon, this.mode) : super(title, details, icon);
}

class Address {
  String nome = "";
  bool inAlarm = false;
  List<Aviso> avisos = [];
}

class Morador{
  String nome;
  String cpf;
  List<Address> residencias;
  Morador(this.nome,this.cpf,this.residencias);
}


class Contact {
  String nome;
  String num;
  Contact(this.nome,this.num);
}

String generateRandomNumber() {
  var random = Random();
  var number = random.nextInt(900000000) + 100000000; // Gera um número de 9 dígitos aleatório
  return number.toString();
}

String formatPhoneNumber(String phoneNumber) {
  var formattedNumber = phoneNumber.substring(0, 9) + "-" + phoneNumber.substring(9);
  return formattedNumber;
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "FIAL",
      home: LoginPage(page: Mode()),
    );
  }
}

class Mode extends StatefulWidget {
  const Mode({Key? key}) : super(key: key);

  @override
  State<Mode> createState() => _ModeState();
}

class _ModeState extends State<Mode> {
  @override
  Widget build(BuildContext context) {
    // return HomePage();
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: const [
                      Colors.black,
                      Color(0xFF000000),
                      Color(0xFF111111),
                      Color(0xFF222222),
                    ],
                  )
              ),
            ),
            Positioned(
              top: 128,
              child: Text(
                "FIRE ALERT",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 64
                )
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DesktopPage()));
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 48,vertical: 24),
                      child: Text("APLICAÇÃO\nDESKTOP",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 36),textAlign: TextAlign.center),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 48,vertical: 24),
                      child: Text("APLICAÇÃO\nMOBILE",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 36),textAlign: TextAlign.center),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back,color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
