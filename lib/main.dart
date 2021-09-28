import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:tic_tac_toe_example/utils.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ohTurn = true; //Vetor para armazenar as 9 posições do jogo da velha
  List<String> displayEx0h = ['','','','','','','','',''];
  var myTextStyle = TextStyle(color: Colors.white, fontSize: 30);
  //placar
  int ohScore = 0;
  int exScore = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Jogador X', style: myTextStyle,),
                        Text(exScore.toString(), style: myTextStyle,),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Jogador O', style: myTextStyle,),
                        Text(ohScore.toString(), style: myTextStyle,),
                      ],
                    ),
                  ),
                ],
              )
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 9,
              gridDelegate:
             SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: (){
                  _tapped(index);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[700]!)
                  ),
                  child: Center(
                    child: Text(displayEx0h[index], style: TextStyle(color: Colors.white, fontSize: 40),),
                  ),
                ),
              );
            }),
          ), Expanded(
            child: Container(
              
            ),
          ),
        ],
      ),
    );
  }
  //função que preenche o espaço clicado alternando entre os jogadores a cada turno
void _tapped (int index) {
  setState(() {
    if (ohTurn && displayEx0h[index] == ''){
      displayEx0h[index] = 'o';
    }
    else if(!ohTurn && displayEx0h[index] == ''){
      displayEx0h[index] = 'x';
    }//atribuição para decidir qual jogador venceu
    ohTurn = !ohTurn;
    _checkWinner();
  });
}
void _checkWinner(){
  //checa a primeira coluna
  if(displayEx0h[0] == displayEx0h[1] &&
     displayEx0h[0] == displayEx0h[2] && 
     displayEx0h[0] != '') {
    _showWinDialog(displayEx0h[0]);
  }
  //checa a segunda coluna
  if(displayEx0h[3] == displayEx0h[4] &&
     displayEx0h[3] == displayEx0h[5] && 
     displayEx0h[3] != '') {
    _showWinDialog(displayEx0h[3]);
  }
  //checa a terceira coluna
  if(displayEx0h[6] == displayEx0h[7] &&
     displayEx0h[6] == displayEx0h[8] && 
     displayEx0h[6] != '') {
    _showWinDialog(displayEx0h[6]);
  }
  //checa a primeira coluna
  if(displayEx0h[0] == displayEx0h[3] &&
     displayEx0h[0] == displayEx0h[6] && 
     displayEx0h[0] != '') {
    _showWinDialog(displayEx0h[0]);
  }
  //checa a segunda coluna
  if(displayEx0h[1] == displayEx0h[4] &&
     displayEx0h[1] == displayEx0h[7] && 
     displayEx0h[1] != '') {
    _showWinDialog(displayEx0h[1]);
  }
  //checa a terceira coluna
  if(displayEx0h[2] == displayEx0h[5] &&
     displayEx0h[2] == displayEx0h[8] && 
     displayEx0h[2] != '') {
    _showWinDialog(displayEx0h[2]);
  }
  //checa a diagonal
  if(displayEx0h[6] == displayEx0h[4] &&
     displayEx0h[6] == displayEx0h[2] && 
     displayEx0h[6] != '') {
    _showWinDialog(displayEx0h[6]);
  }
  //checa a diagonal
  if(displayEx0h[0] == displayEx0h[4] &&
     displayEx0h[0] == displayEx0h[8] && 
     displayEx0h[0] != '') {
    _showWinDialog(displayEx0h[0]);
  }
}
//Mostra a caixa de diálogo indicando o vencedor
void _showWinDialog(String winner){
  showDialog(
    context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text(winner + ' É O VENCEDOR'),
      );
    }
  );//condição para aumentar o placar a cada vez que um jogador ganha
  if(winner == 'o'){
    ohScore += 1;
  } 
  else if(winner == 'x'){
    exScore += 1;

  }//função para limpar o placar
  _clearBoard();
}
void _clearBoard(){

}
}

