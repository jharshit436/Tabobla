
import 'dart:collection';
import 'dart:math';

import 'package:housie/game_board.dart';
class  RandomNumbers{
    Queue<int> VistedList=new Queue();
    RandomNumbers(){
      VistedList.add(0);
    }
   
  var isVisted=List.filled(100,0);

  GameBoard gb=new GameBoard();

  int Generate(){  
    if(VistedList.length==90){
      return 0;
    } 
    var rng=Random();
    var RandomInt=rng.nextInt(90)-1;
    while(isVisted[RandomInt+1]==1){
      RandomInt=rng.nextInt(90)-1;
      print(RandomInt+1);
      print("List Length  ${VistedList.length}");
    }
    isVisted[RandomInt+1]=1;
    return RandomInt+1;
  }

  void AddinginList(int x){
      if(VistedList.first==0){
        VistedList.remove(0);
      }
      VistedList.add(x);
      // if(VistedList.length==15){
      //   VistedList.remove(VistedList.length-1);
      // }
    }


}