import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'mobile.dart';
import 'desktop.dart';
import 'dart:io';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key, required this.page}) : super(key: key);
  final Widget page;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: LayoutBuilder(
                    builder: (context,constraints){
                      return Text(
                        "FIRE ALERT",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: constraints.maxWidth*.12,
                        )
                      );
                    },
                  ),
                ),
              ),

              Expanded(
                child: LayoutBuilder(
                  builder: (context,constraints){
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              for(int i = 0; i < 2; i++)
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: constraints.maxWidth*0.1,vertical: constraints.maxHeight*0.015),
                                  child: Container(
                                    constraints: const BoxConstraints(maxWidth: 500,maxHeight: 100),
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
                                                padding: const EdgeInsets.only(right: 8),
                                                child: Icon([Icons.person_rounded,MdiIcons.lockOutline][i],color: Colors.black,size: constraints.maxHeight*.6),
                                              ),
                                              Expanded(
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    hintText: i == 0? "Username":"Password",
                                                  ),
                                                  style: TextStyle(
                                                    fontSize: constraints.maxHeight*.35,
                                                  ),
                                                  obscureText: i == 1,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.zero,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
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
                                  ]
                                ),
                                child: Center(child: Text("Login",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: constraints.maxHeight*.15))),
                              ),
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.symmetric(vertical: constraints.maxHeight*.025),
                        //   child: RawMaterialButton(
                        //     onPressed: (){
                        //       Navigator.push(context, MaterialPageRoute(builder: (context) => widget.page));
                        //     },
                        //     constraints: const BoxConstraints(),
                        //     child: Container(
                        //       height: constraints.maxHeight,
                        //       width: constraints.maxWidth,
                        //       decoration: BoxDecoration(
                        //         color: Colors.blue,
                        //         borderRadius: BorderRadius.circular(5),
                        //         boxShadow: const [
                        //           BoxShadow(
                        //             color: Colors.black12,
                        //             blurRadius: 3,
                        //             offset: Offset(0, 3),
                        //           )
                        //         ]
                        //       ),
                        //       constraints: const BoxConstraints(maxHeight: 55,maxWidth: 325),
                        //     ),
                        //   ),
                        // ),
                      ],
                    );
                  }
                ),
              ),

            ],
          )
      ),
    );
  }
}