import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:housie/services/random_number.dart';
import 'package:krutidevtounicode/krutidevtounicode.dart';
import 'dart:collection';

import 'package:restart_app/restart_app.dart';
class GameBoard extends StatefulWidget {
  @override
  State<GameBoard> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  final FlutterTts tts=FlutterTts();
   final FlutterTts hinditts=FlutterTts();
  final RandomNumbers rn=RandomNumbers();

  @override
  void initState() {
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    bool Checkvisted(int x){
      if(rn.isVisted[x]==1){
        return true;
        }
      else{
        return false;
        }
    }
    
    void speak(String text) async{
      await tts.setLanguage('en-US');
      await tts.setPitch(100);
      await tts.speak(text);
      
    }

    void speakhin(String text) async{
      var text=KrutidevToUnicode.convertToUnicode("gsyks oYMZ");
      
      await hinditts.speak(text);
    }

    

    String PrintLastFIveIfExists(){
      print(rn.VistedList);
      if(rn.VistedList.last==0)
      return "";
      // else{
      //   if(rn.VistedList.length==1){
      //     return rn.VistedList.last.toString();
      //   }
      //   else if(rn.VistedList.length==2){
      //     String s=rn.VistedList.last.toString()+" ";
      //     s=s+rn.isVisted[1].toString();
      //     return s;
      //   }
      //   else{
      //     String s=rn.VistedList.last.toString()+ " ";
      //     s=s+rn.isVisted[rn.VistedList.length-2].toString()+" ";
      //     s=s+rn.isVisted[rn.VistedList.length-3].toString()+" ";
      //     return s;
      //   }
      // }
      String s= rn.VistedList.toString().replaceAll('{',"");
      s=s.replaceAll('}', " ");
      s=s.replaceAll(",","  ");
      return s;
    }
    
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        
      ),
      body: Container(
          
          child: Column(
            
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:Border.all(
                                width: 1,
                                color: Colors.deepPurple
                              )
                  
                            ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width:50,
                          height: 50,
                          child: Center(child: Text(rn.VistedList.last.toString(),style: TextStyle(fontSize: 30),)),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border:Border.all(
                                  width: 1,
                                  color: Colors.deepPurple
                                )
                                          
                              ),
                        ),
                      ),
                      Container(
                        width: 250,
                        child: SingleChildScrollView(child: Expanded(child: Text(PrintLastFIveIfExists(),overflow: TextOverflow.ellipsis,softWrap:false,maxLines: 1000,))),
                      )
                      // Padding(
                      //   padding: EdgeInsets.all(15),
                      // child:Container(
                      //   width: 500,
                      //   child:Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       Expanded(child: Text(PrintLastFIveIfExists(),overflow: TextOverflow.ellipsis,softWrap: false,maxLines: 100,)),
                      //     ],
                      //   )
                      // ) ,
                      // )
                    ],
                  ),
                ),
              )
             ,
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: GridView.builder(itemCount: 90,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 10), itemBuilder: (context,index){
                    return Padding(
                      padding: EdgeInsets.all(3),
                      child: Container(
                        height: 50,
                        width: 50,
                        child: Container(
                          
                          decoration: BoxDecoration(
                            color: Checkvisted(index)?Colors.deepPurple:Colors.transparent,
                            borderRadius: BorderRadius.circular(5),
                            border:Border.all(
                              width: 1,
                              color: Colors.deepPurple
                            )
                
                          ),
                          
                          child: Center(child: Text((index+1).toString()))
                          ),
                        ),
                    );
                  }),
                ),
              ),
              Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: ElevatedButton(
                      onPressed: () {
                        Restart.restartApp();
                      },
                      child:Text("Reset"),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                  )
                  ,
                  Container(
                    child: ElevatedButton(onPressed: () {
                  
                     
                      setState(() {
                          int x=rn.Generate();
                      print(x);
                      // print(rn.VistedList);
                      rn.AddinginList(x+1);
                      // speak((x+1).toString());
                      speakhin((x+1).toString());
                    

                       });
                      
                    },
                    child: Text("Hindi")
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.10,
              )

            ],
          ),
        
        ),
    
    );
  }
}