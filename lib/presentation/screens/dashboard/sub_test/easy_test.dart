import 'package:chinese_learning/presentation/colors/colors.dart';
import 'package:flutter/material.dart';

class EasyQuizPage extends StatefulWidget {
  const EasyQuizPage({Key? key}) : super(key: key);

  @override
  State<EasyQuizPage> createState() => _EasyQuizPageState();
}

class _EasyQuizPageState extends State<EasyQuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.L_RED,
      body: Column(children: const [
        Text("Question goes here"),
      ]),
    );
  }
}

// import 'package:chinese_learning/presentation/colors/colors.dart';
// import 'package:flutter/material.dart';

// class EasyTestPage extends StatefulWidget {
//   const EasyTestPage({Key? key}) : super(key: key);
  

//   @override
//   State<EasyTestPage> createState() => _EasyTestPageState();
// }

// var counter=0;
   
//     List qList =[
//     Questions("1.The human body has four lungs.", false),
//     Questions("2.Kelvin is a measure of temperature.", true),
//     Questions("3.The Atlantic Ocean is the biggest ocean on Earth.",false),
//     Questions("4.Sharks are mammals.",false),
//     Questions("5.The human skeleton is made up of less than 100 bones.",false),
//     Questions("6.Atomic bombs work by atomic fission.",true),
//     Questions("7.Molecules are chemically bonded.",true),
//     Questions("8.Spiders have six legs.",false),
//     Questions("9.Mount Kilimanjaro is the tallest mountain in the world.",false),
//     Questions("10.The study of plants is known as botany.",true),

//   ];

//     var score=0;

//     checkWin(bool userChoice , BuildContext context )
// {
  

//     if(userChoice==qList[counter].isCorrect)
//  { 
//     print("correct");
     
//      score= score+5;
//     final snackbar = SnackBar(
//       duration: Duration(milliseconds : 500),
//       backgroundColor: Colors.green,
//       content: Text("Correct!"),);
//     Scaffold.of(context).showSnackBar(snackbar);
//  }
//  else 
//  {print("false");
//         score = score+0;
//     final snackbar = SnackBar(
//       duration: Duration(milliseconds : 500),
//       backgroundColor: Colors.red,
//       content: Text("Incorrect!"),
//       );
//     Scaffold.of(context).showSnackBar(snackbar);
//  }
//     setState(() {
 
//    if(counter<9)
//    {
//      counter = counter +1;
//    }
 
    
//   });
  
  
// } 
 
//  reset()
//  {
//    setState(() {
//      counter = 0;
//      score =0;
//    });
//  }


// class _EasyTestPageState extends State<EasyTestPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: CustomColors.L_RED,
//       body: Builder(
//               builder : (BuildContext context) => Container(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,

//             children: <Widget>[

//               Container(height: 400,
//               width: 500,
//               decoration: BoxDecoration(
//                 image: DecorationImage(image: AssetImage("images/png.png"),
//                 fit: BoxFit.fill ),
//                 ),
//               ),

//               Padding(padding: EdgeInsets.only(top: 30)),


//               Container(
//                 child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: <Widget>[
//                     Text("Score : $score /50",style: TextStyle(color : Colors.brown , 
//                     fontSize: 20,fontWeight: FontWeight.bold),),
                
//                     InkWell(
//                      child: Text("Reset Game",style: TextStyle(fontSize: 18,color: Colors.redAccent,fontWeight: FontWeight.bold),),
//                      onTap: reset,
//                    )

//                  ],
//                ),
              
//               ),

//              Padding(padding: EdgeInsets.only(top: 30)),
              
//               Container(
//                     decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12.0),
//                     border: Border.all(color: Color(0xFFF7C229))
//                   ),
//                   height: 90.0,
//                   width: 400,
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.center,
//                        children: <Widget>[
//                          FittedBox(child: Text(qList[counter].qText,style: TextStyle(fontSize: 18.0,)),)

//                        ],
//                      ),             
                     
//                ),

//               Padding(padding: EdgeInsets.only(top: 30)),
                      
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
                   
//                 RaisedButton(onPressed:()=> checkWin(true, context),

//                 padding: EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 30.0),
                
//                 child: Text("TRUE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

//                 color:  Color(0xFFF7C229),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)
//                 ),
//                 ),
                 
//               RaisedButton(onPressed: ()=> checkWin(false,context),

//                 padding: EdgeInsets.fromLTRB(50.0, 30.0, 50.0, 30.0),
                
//                 child: Text("FALSE",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),

//                 color: Color(0xFFF7C229),

//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10)
//                 ),
//                 )
//                 ],
//               ),

              

//              ],
//           ),
//         ),
//       ),
//     );
//   }
// }
