import 'package:fial_pi1/main.dart';
import 'package:flutter/material.dart';

// ignore_for_file: prefer_const_constructors
class DesktopPage extends StatefulWidget {
  const DesktopPage({Key? key}) : super(key: key);

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1E1E1E),
        body: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(

                    ),
                  ),
                  Expanded(
                    child: Container(
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                    ),
                  ),
                  Expanded(
                    child: Container(
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}

class ColumnSection extends StatefulWidget {
  const ColumnSection({Key? key, required this.cards}) : super(key: key);
  final List<Card> cards;
  @override
  State<ColumnSection> createState() => _ColumnSectionState();
}

class _ColumnSectionState extends State<ColumnSection> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(),
    );
  }
}


Map<String,List<Color>> gradients = {
  "fire":[
    Colors.deepOrange,
    Colors.red,
    Colors.redAccent,
  ],
  "light":[
    Colors.black,
    Color(0xFF222222),
  ],
  "water":[
    Colors.blueAccent,
    Colors.blue,
    Colors.lightBlue,
    Colors.lightBlueAccent,
  ],
  "normal":[
    Colors.white,
    Colors.white,
  ],
};

class Card extends StatefulWidget {
  const Card({Key? key, required this.icon, required this.title, required this.details, required this.type, required this.height, required this.width}) : super(key: key);
  final IconData icon;
  final String title;
  final String details;
  final double height, width;
  // normal, fire, light, water, infect
  final String type;
  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  String alertMsg = "ATENÇÃO: Mantenha a calma e siga imediatamente as orientações de evacuação. Dirija-se a saída de emergência mais próxima evitando o uso de elevadores, não retorne ao edifício até receber autorização das autoridades competentes, priorize a sua segurança e a dos demais.";

  @override
  Widget build(BuildContext context) {
    Color fontColor = widget.type != 'normal'? Colors.white:Colors.black;

    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.5),
        color: Colors.white,
        gradient: LinearGradient(
          colors: gradients[widget.type]!,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter
        )
      ),
      child: Row(
        children: [
          // Icon
          Expanded(
            child: LayoutBuilder(
              builder: (context,constraints){
                return Icon(
                  widget.icon,
                  size: constraints.maxHeight*.4,
                  color: fontColor,
                );
              },
            ),
          ),

          // BoxText
          Expanded(
            flex: 3,
            child: LayoutBuilder(
              builder: (context,constraints){
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.title,style: TextStyle(color: fontColor,fontWeight: FontWeight.bold)),
                      Expanded(
                        child: SizedBox(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 24),
                              child: Text(alertMsg,textAlign: TextAlign.justify,style: TextStyle(color: fontColor)),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
