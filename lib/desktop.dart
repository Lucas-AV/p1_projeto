import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({Key? key}) : super(key: key);

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  String template = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed consequat lectus id magna consequat, eget gradiv urna commodo. Integer sed volutpat neque, at pulvinar turpis. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae. Aliquam erat volutpat.";

  List<Aviso> listaAvisos = [
    Aviso(
      'Alerta de incêndio',
      alertMsg,
      Icons.warning_rounded,
    ),
    Aviso(
      'Falta de luz',
      'Informamos que ocorreu uma queda de energia no condomínio. A equipe técnica já está trabalhando para resolver o problema. Pedimos desculpas pelo inconveniente e agradecemos pela compreensão.',
      Icons.dark_mode_outlined,
    ),
    Aviso(
      'Falta de água',
      'Prezados moradores, identificamos problemas com o encanamento e o abastecimento de água no prédio. Nossa equipe de manutenção está trabalhando para resolver a situação o mais rápido possível. Pedimos desculpas pelos transtornos causados e agradecemos pela compreensão.',
      Icons.water_drop_outlined,
    ),
    Aviso(
      "Manutenção",
      "Manutenção nos elevadores programada para as 19h do dia 27/06 até as 22h.",
      Icons.settings,
    ),
    Aviso(
      'Piscina interditada',
      'A piscina principal do condomínio está interditada por tempo indeterminado.',
      Icons.pool,
    ),
    Aviso(
        'Mudança de clima',
        'Atenção moradores: Prevê-se mudanças abruptas no clima nos próximos dias. Por favor, estejam preparados para variações de temperatura, chuvas intensas ou ventos fortes. Tomem as devidas precauções e estejam atentos às orientações adicionais da administração do prédio',
        Icons.thunderstorm_rounded
    ),
  ];

  List<Morador> moradores = [
    Morador('João', '123.456.789-00',[]),
    Morador('Maria', '987.654.321-00',[]),
    Morador('Pedro', '111.222.333-00',[]),
    Morador('Lucas', '111.222.333-00',[])
  ];

  Widget avisoCard(Aviso aviso){
    Color fontColor = getMode(aviso).isNotEmpty? Colors.white:Colors.black;
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Container(
            decoration: BoxDecoration(
                color: getMode(aviso).isNotEmpty? Colors.red : Colors.white,
                gradient: LinearGradient(
                  colors: getMode(aviso).isNotEmpty? gradients[getMode(aviso)] ?? [Colors.white, Colors.white] : [Colors.white,Colors.white],
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
                  child: Icon(aviso.icon,size: 64,color: fontColor,),
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
                              child: FittedBox(alignment: Alignment.centerLeft,child: Text(aviso.title,style: TextStyle(color: fontColor,fontWeight: FontWeight.bold))),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 24),
                                  child: Text(aviso.details,textAlign: TextAlign.justify,style: TextStyle(color: fontColor)),
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
          child: PopupMenuButton(
            tooltip: "",
            itemBuilder: (context) => [
              for(int i = 0; i < 2; i++)
                PopupMenuItem(
                  onTap: (){
                    setState(() {
                    });
                  },
                  value: i,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon([Icons.edit,Icons.delete][i],color: Colors.black,size: 24,),
                      ),
                      FittedBox(child: Text(["Editar","Excluir"][i])),
                    ],
                  ),
                ),
            ],
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
                child: const Icon(Icons.edit)
            ),
          ),
        ),
      ],
    );
  }

  Widget personCard(Morador morador){
    return Stack(
      alignment: Alignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
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
                  child: Icon(Icons.person,size: 64,color: Colors.black),
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
                              child: FittedBox(alignment: Alignment.centerLeft,child: Text(morador.nome,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
                            ),
                          ),
                          Expanded(
                            child: SizedBox(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 24),
                                  child: Text("O morador, ${morador.nome}, de CPF, ${morador.cpf}, está cadastrado no sistema FIAL do condomínio.",textAlign: TextAlign.justify,style: TextStyle(color: Colors.black)),
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
          child: PopupMenuButton(
            tooltip: "",
            itemBuilder: (context) => [
              for(int i = 0; i < 2; i++)
                PopupMenuItem(
                  onTap: (){
                    setState(() {});
                  },
                  value: i,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon([Icons.edit,Icons.delete][i],color: Colors.black,size: 24,),
                      ),
                      FittedBox(child: Text(["Editar","Excluir"][i])),
                    ],
                  ),
                ),
            ],
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
                child: const Icon(Icons.edit)
            ),
          ),
        ),
      ],
    );
  }

  Widget sensorCard({String title = "Sensores de fumaça", IconData icon = Icons.sensors}){
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
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
                  child: Icon(icon,size: 64,),
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
                              child: FittedBox(alignment: Alignment.centerLeft,child: Text(title,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
                            ),
                          ),

                          const Expanded(
                            child: SizedBox(
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 24),
                                  child: Text("Informações sobre o sensor...",textAlign: TextAlign.justify,style: TextStyle(color: Colors.black)),
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
                  child: const Icon(Icons.add,size: 32)
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget relatoriosCard({String title = "Relatório diário", String date = "26/05/23"}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
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
              child: Icon(MdiIcons.fileDocumentMultiple,size: 64,),
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
                          child: FittedBox(alignment: Alignment.centerLeft,child: Text("$title ($date)",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
                        ),
                      ),

                      const Expanded(
                        child: SizedBox(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.only(right: 24),
                              child: Text("Resumo do conteúdo...",textAlign: TextAlign.justify,style: TextStyle(color: Colors.black)),
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
    );
  }

  Widget sector({
    String title = "Template",
    double underlineWidth = 300,
    Widget bottomButton = const SizedBox(),
    List<Widget> children = const [],
  }){
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 36,right: 36,top: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16,left: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 64,
                            shadows: const [Shadow(color: Colors.black12,blurRadius: 1)]
                        )
                    ),
                  ),
                  Container(color: Colors.white,width: underlineWidth,height: 8,),
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                childAspectRatio: 3,
                crossAxisCount: 2,
                children: children,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: bottomButton,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  bool createMorador = false;
  bool createContato = false;
  bool createAviso = false;

  Widget wLogin(double fontSize){
    return Expanded(
      child: Padding(
        padding: EdgeInsets.zero,
        child: GestureDetector(
          onTap: (){
            setState(() {
              createAviso = false;
              createMorador = false;
              createContato = false;
            });
          },
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 3,
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))
            ),
            child: Center(child: Text("Cadastrar",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: fontSize))),
          ),
        ),
      ),
    );
  }

  Widget wMorador(){
    return createMorador? GestureDetector(
      onTap: (){
        setState(() {
          createMorador = false;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black45,
        child: Center(
          child: Container(
            width: 660,
            height: 540,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: LayoutBuilder(
              builder: (context,constraints){
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("CADASTRO DE MORADOR",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 36),),
                    ),

                    for(int i = 0; i < 3; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: constraints.maxHeight*0.015),
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 525,maxHeight: 100),
                          width: double.infinity,
                          height: constraints.maxHeight*0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: LayoutBuilder(
                            builder: (context,constraints){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 18),
                                      child: Icon([Icons.person_rounded,Icons.credit_card,Icons.phone][i],color: Colors.black,size: constraints.maxHeight*.6),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: ["Nome","CPF","Telefone"][i],
                                        ),
                                        style: TextStyle(
                                          fontSize: constraints.maxHeight*.35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    wLogin(constraints.maxHeight*.10),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    ) : const SizedBox();
  }

  Widget wContato(){
    return createContato? GestureDetector(
      onTap: (){
        setState(() {
          createContato = false;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black45,
        child: Center(
          child: Container(
            width: 660,
            height: 420,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: LayoutBuilder(
              builder: (context,constraints){
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("CADASTRO DE CONTATO DE EMERGÊNCIA",

                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 36),),
                    ),

                    for(int i = 0; i < 2; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: constraints.maxHeight*0.015),
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 525,maxHeight: 100),
                          width: double.infinity,
                          height: constraints.maxHeight*0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: LayoutBuilder(
                            builder: (context,constraints){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 18),
                                      child: Icon([Icons.person_rounded, Icons.phone][i],color: Colors.black,size: constraints.maxHeight*.6),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: ["Nome","Telefone"][i],
                                        ),
                                        style: TextStyle(
                                          fontSize: constraints.maxHeight*.35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 15,
                    ),
                    wLogin(constraints.maxHeight*.10),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    ) : const SizedBox();
  }

  int avisoIDX = 0;
  Widget wAviso(){
    return createAviso? GestureDetector(
      onTap: (){
        setState(() {
          createAviso = false;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.black45,
        child: Center(
          child: Container(
            width: 660,
            height: 540,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: LayoutBuilder(
              builder: (context,constraints){
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text("CADASTRAR AVISO",

                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 36),),
                    ),

                    for(int i = 0; i < 2; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: constraints.maxHeight*0.015),
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 525,maxHeight: 100),
                          width: double.infinity,
                          height: constraints.maxHeight*0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: LayoutBuilder(
                            builder: (context,constraints){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 18),
                                      child: Icon([Icons.person_rounded,Icons.info][i],color: Colors.black,size: constraints.maxHeight*.6),
                                    ),
                                    Expanded(
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: ["Título","Descrição"][i],
                                        ),
                                        style: TextStyle(
                                          fontSize: constraints.maxHeight*.35,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                    PopupMenuButton(
                      tooltip: "",
                      itemBuilder: (context) => [
                        for(int i = 0; i < listaAvisos.length; i++)
                          PopupMenuItem(
                            onTap: (){
                              setState(() {
                                avisoIDX = i;
                              });
                            },
                            value: i,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(listaAvisos[i].icon,color: Colors.black,size: 36,),
                                ),
                                FittedBox(child: Text(listaAvisos[i].title)),
                              ],
                            ),
                          ),
                      ],
                      offset: const Offset(0,100),
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: constraints.maxHeight*0.015),
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 525,maxHeight: 100),
                          width: double.infinity,
                          height: constraints.maxHeight*0.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 4),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: LayoutBuilder(
                            builder: (context,constraints){
                              return Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 18),
                                      child: Icon(listaAvisos[avisoIDX].icon,color: Colors.black,size: constraints.maxHeight*.6),
                                    ),
                                    Expanded(
                                      child: Text(
                                        listaAvisos[avisoIDX].title,
                                        style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: constraints.maxHeight*.35,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 8.0),
                                      child: Icon(Icons.arrow_drop_down,color: Colors.black,size: 36),
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 15,
                    ),
                    wLogin(constraints.maxHeight*.10),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    ) : const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            PopupMenuButton(
              tooltip: "",
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text("Logout do sistema"),
                      Icon(Icons.logout,color: Colors.black)
                    ],
                  ),
                  onTap: (){
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                ),
              ],
              child: const Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 32,
                ),
              ),

            ),
          ],
        ),
        backgroundColor: const Color(0xff1E1E1E),
        body: Stack(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      sector(
                          title: "Aviso",
                          underlineWidth: 120,
                          bottomButton: Row(
                            children: [
                              RawMaterialButton(
                                onPressed: (){
                                  setState(() {
                                    createAviso = true;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7.5),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 2),
                                  child: const Center(child: Text("Cadastrar\naviso",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24))),
                                ),
                              ),
                              const SizedBox(width: 15),
                              RawMaterialButton(
                                onPressed: (){
                                  setState(() {
                                    createContato = true;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7.5),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 2),
                                  child: const Center(child: Text("Cadastrar\ncontato",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24))),
                                ),
                              ),
                            ],
                          ),
                          children: [
                            for(Aviso aviso in listaAvisos)
                              avisoCard(aviso)
                          ]
                      ),
                      sector(
                          title: "Moradores",
                          underlineWidth: 250,
                          bottomButton: Row(
                            children: [
                              RawMaterialButton(
                                onPressed: (){
                                  setState(() {
                                    createMorador = true;
                                  });
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7.5),
                                  ),
                                  padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 2),
                                  child: const Center(child: Text("Cadastrar\nmorador",textAlign: TextAlign.center,style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24))),
                                ),
                              ),
                            ],
                          ),
                          children: [
                            for(Morador morador in moradores)
                              personCard(morador)
                          ]
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      sector(
                        title: "Status dos sensores",
                        underlineWidth: 500,
                        children: [
                          sensorCard(title: "Sensores de fumaça",icon: Icons.sensors),
                          sensorCard(title: "Sensores de temperatura",icon: Icons.thermostat_outlined),
                          sensorCard(title: "Luzes de emergência",icon: MdiIcons.lightbulbOnOutline),
                          sensorCard(title: "Fechaduras magnéticas",icon: Icons.lock_outline),
                        ],
                      ),
                      sector(title: "Relatórios",underlineWidth: 250,
                        children: [
                          relatoriosCard(title:"Relatório diário",date: "19/06/2023"),
                          relatoriosCard(title:"Relatório diário",date: "18/06/2023"),
                          relatoriosCard(title:"Relatório diário",date: "11/06/2023"),
                          relatoriosCard(title:"Relatório diário",date: "04/06/2023"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            wMorador(),
            wContato(),
            wAviso(),
          ],
        ),
      ),
    );
  }
}

