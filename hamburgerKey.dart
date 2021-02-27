import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin{
  // 0이면 움직일 수 있어
  List<int> flag = [0, 0, 0, 0, 0, 0, 0, 0];    // 꼬치, 빵, 상추, 치즈, 토마토, 양파, 고기, 빵2
  int hidden = 0;
  int key = 0;

  List<AlignmentDirectional> ad = [AlignmentDirectional(0.0, -0.5), AlignmentDirectional(0.0, -0.16), AlignmentDirectional(0.0, 0.0),
                                  AlignmentDirectional(0.0, 0.1), AlignmentDirectional(0.0, 0.2),
                                  AlignmentDirectional(0.0, 0.3), AlignmentDirectional(0.0, 0.4), AlignmentDirectional(0.0, 0.5)];
  AlignmentDirectional _hidden = AlignmentDirectional(0.0, 0.15);
  AlignmentDirectional _key = AlignmentDirectional(0.0, 0.15);

  List<double> position = [-0.5, -0.16, 0.0, 0.1,           0.2, 0.3, 0.4, 0.5, 0.15, 0.15];     // ~~~~~, hidden, key
  //List<double> position = [-0.6, -0.3, -0.1, 0.0, 0.12, 0.22, 0.32, 0.42, 0.06, 0.06];     // ~~~~~, hidden, key

  int _checkFlagHK(){
    if (hidden == 0)
      return 0;
    if (hidden == 1){
      return 1;
    }
  }

  bool _checkFlag(int a){
    if (flag[a] == 0){  // a번째를 움직이고 싶을 때
      for(var i = 0; i<a; i++){
        if (flag[i] == 0)
          return false;
      }
    }
    else{   // a번째를 원위치 시키고 싶을 때
      for(var i = flag.length -1 ; i>a; i--){
        if (flag[i] == 1)
          return false;
      }
    }
    return true;
  }

  void _stopMove(){
    key = 1;
  }

  void _setMove(int a){
    setState(() {
      if (key == 0) {
        if (flag[a] == 0) { // up 움직이기 전
          ad[a] = AlignmentDirectional(0.0, position[a] - 0.3);
          flag[a] = 1;
          if (a == 3 || a == 4) { // flag[a] = 0
            _hidden = AlignmentDirectional(0.0, position[8] - 0.3);
            _key = AlignmentDirectional(0.0, position[9] - 0.3);
          }
        }
        else { // down 원위치로 가고 싶을 때
          ad[a] = AlignmentDirectional(0.0, position[a]);
          flag[a] = 0;
          if (a == 3 || a == 4) { // flag[a] = 1
            _hidden = AlignmentDirectional(0.0, position[8]);
            _key = AlignmentDirectional(0.0, position[9]);
          }
        }
        hidden = 0;
      }
    });
  }

  void _setHidden(){
    setState(() {
      for (var i = 0; i<3; i++){
        if (flag[1] == 0)
          return;
      }
      if (hidden == 0 && flag[3] == 0 && flag[4] == 0){
        ad[3] = AlignmentDirectional(0.0, position[3]-0.3);
        _key = AlignmentDirectional(0.0, (position[3]+position[4]-0.3)/2);
        _hidden = AlignmentDirectional(0.0, (position[3]+position[4]-0.3)/2);
      }
      else if (hidden == 0 && flag[3] == 1 && flag[4] == 1){
        ad[4] = AlignmentDirectional(0.0, position[4]);
        _key = AlignmentDirectional(0.0, (position[3]+position[4]-0.3)/2);
        _hidden = AlignmentDirectional(0.0, (position[3]+position[4]-0.3)/2);
      }
      flag[3] = 1;
      flag[4] = 0;
      hidden = 1;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text('hamburger'),
      ),*/
        body: Stack(
          children: <Widget>[
            Align(
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: _key,
                  child: GestureDetector(
                    child: Image.asset('image/hamburgerset/key.png',),
                    onTap: (){
                      _stopMove();
                      print("키");
                      Navigator.pushReplacementNamed(context, '/second');
                    },
                  )
              ),
            ),
            Align(
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: ad[0],
                  child: GestureDetector(
                    child: Image.asset('image/hamburgerset/ggochi.png',),
                    onTap: (){
                      if (_checkFlag(0))
                        _setMove(0);
                      print("꼬치");
                    },
                  )
              ),
            ),
            Align(
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: ad[1],
                  child: GestureDetector(
                    child: Image.asset('image/hamburgerset/bbang.png',),
                    onTap: (){
                      if (_checkFlag(1))
                        _setMove(1);
                      print("빵");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: ad[2],
                  child: GestureDetector(
                    child: Image.asset('image/hamburgerset/sangchu.png',),
                    onTap: (){
                      if (_checkFlag(2))
                        _setMove(2);
                      print("상추");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: ad[3],
                  child: GestureDetector(
                    child: Image.asset('image/hamburgerset/cheese.png',),
                    onTap: (){
                      if (_checkFlagHK() == 0 && (_checkFlag(3) || _checkFlag(4))){
                        _setMove(3);
                        _setMove(4);
                      }
                      else if (_checkFlagHK() == 1 && _checkFlag(3)){
                        _setMove(3);
                      }
                      print("치즈");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: ad[4],
                  child: GestureDetector(
                    child: Image.asset('image/hamburgerset/tomato.png',),
                    onTap: (){
                      if (_checkFlagHK() == 0 && (_checkFlag(3) || _checkFlag(4))){
                        _setMove(3);
                        _setMove(4);
                      }
                      else if (_checkFlagHK() == 1 && _checkFlag(4)){
                        _setMove(4);
                      }

                      print("토마토");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: ad[5],
                  child: GestureDetector(
                    child: Image.asset('image/hamburgerset/yangpa.png',),
                    onTap: (){
                      if (_checkFlag(5))
                        _setMove(5);
                      print("양파");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: ad[6],
                  child: GestureDetector(
                    child: Image.asset('image/hamburgerset/gogi.png',),
                    onTap: (){
                      if (_checkFlag(6))
                        _setMove(6);
                      print("고기");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: ad[7],
                  child: GestureDetector(
                    child: Image.asset('image/hamburgerset/bbang2.png',),
                    onTap: (){
                      if (_checkFlag(7))
                        _setMove(7);
                      print("빵2");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: _hidden,
                  child: GestureDetector(
                    child: Image.asset('image/hamburgerset/hamjung.png',),
                    onTap: (){
                      _setHidden();
                      print("hidden");
                    },
                  )
              ),
            ),
          ],
        )
    );
  }

}
