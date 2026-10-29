import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //App bar
      appBar: AppBar(
        title: Text("Perfil Profissional"),
        backgroundColor: Colors.lightBlue,
      ),

      //Row
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(20)
          ),
          child: Column(
            children: [
              //Filho Coluna 01
              Row(
                children: [
                  //Filho Linha 01
                  CircleAvatar(child: Icon(Icons.person),),

                  //Filho Linha 02
                  Expanded(
                    child: Text(
                      "Pedro Engenheiro de Software!",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20,),
              Text("Projetos Acessiveis em: "),
              SizedBox(height: 8,),
              Text("Londrina - Paraná"),
            ],
          ),
        ),
      ),
    );
  }
}
