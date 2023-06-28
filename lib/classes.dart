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
  String cnpj;
  String senha;
  List<Morador> moradores;
  List<Aviso> avisos;
  Residencia(this.cnpj,this.senha,this.moradores,this.avisos);
}

class Morador{
  String senha;
  String nome;
  String cpf;
  List<Residencia> residencias;
  Morador(this.nome,this.cpf,this.senha,this.residencias);
}