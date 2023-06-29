import 'package:flutter/material.dart';

class Card {
  String title;
  String details;
  IconData icon;
  Card(this.title,this.details,this.icon);
}

class Aviso extends Card {
  bool urgente;
  Aviso(String title, String details, IconData icon, this.urgente) : super(title, details, icon);
}

class Contato extends Card {
  String telefone;
  Contato(String title, String details, IconData icon, this.telefone) : super(title, details, icon);
}

class Residencia {
  String usuario;
  String nome;
  String senha;
  List<Morador> moradores;
  List<Aviso> avisos;
  Residencia(this.usuario,this.nome,this.senha,this.moradores,this.avisos);
}

class Morador{
  String senha;
  String nome;
  String cpf;
  List<Residencia> residencias;
  Morador(this.nome,this.cpf,this.senha,this.residencias);
}


class CardWidget extends StatefulWidget {
  CardWidget({Key? key, required this.card}) : super(key: key);
  final Card card;
  List<Color> gradient = [Colors.white, Colors.white];
  Color fontColor = Colors.black;
  Color color = Colors.white;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Container(
            decoration: BoxDecoration(
                color: widget.color,
                gradient: LinearGradient(
                  colors: widget.gradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),

                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(0,3)
                  )
                ]
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Icon(widget.card.icon,size: 64,color: widget.fontColor),
                ),
                Expanded(
                  child: SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 30,
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: FittedBox(alignment: Alignment.centerLeft,child: Text(widget.card.title,style: TextStyle(color: widget.fontColor,fontWeight: FontWeight.bold))),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 24),
                                  child: Text(widget.card.details,textAlign: TextAlign.justify,style: TextStyle(color: widget.fontColor)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            offset: Offset(0,3),
                            blurRadius: 3
                        )
                      ]
                  ),
                  child: Icon(Icons.edit)
              ),
            ),
          ),
        ),
      ],
    );
  }
}
