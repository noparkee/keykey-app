import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

final routes = {
  '/': (BuildContext context) => Page1(),
  '/first': (BuildContext context) => Page1(),
  '/second': (BuildContext context) => Page2(),
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: Page1(),
      routes: routes,
    );
  }
}



class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('chick'),
      ),
    );
  }

}


class _Page1State extends State<Page1> with TickerProviderStateMixin{
  // 0이면 움직일 수 있어
  List<int> flag = [0, 0, 0, 0, 0, 0, 0, 0];    // 꼬치, 빵, 상추, 치즈, 토마토, 양파, 고기, 빵2
  int hidden = 0;
  int key = 0;

  List<AlignmentDirectional> ad = [AlignmentDirectional(0.0, -0.2), AlignmentDirectional(0.0, 0.0), AlignmentDirectional(0.0, 0.1),
                                  AlignmentDirectional(0.0, 0.15), AlignmentDirectional(0.0, 0.2),
                                  AlignmentDirectional(0.0, 0.25), AlignmentDirectional(0.0, 0.3), AlignmentDirectional(0.0, 0.35)];
  AlignmentDirectional _hidden = AlignmentDirectional(0.0, 0.165);
  AlignmentDirectional _key = AlignmentDirectional(0.0, 0.165);

  List<double> position = [-0.2, 0.0, 0.1, 0.15,           0.2, 0.25, 0.3, 0.35, 0.165, 0.165];     // ~~~~~, hidden, key
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
      appBar: AppBar(
        title: Text('hamburger'),
      ),
      body: Stack(
        children: <Widget>[
            Align(
              child: GestureDetector(
                child: AnimatedContainer(
                 duration: Duration(seconds: 1),
                 alignment: _key,
                 child: Container(
                   child: Image.asset('image/key.png', height: 20,)
                 ) ,
                ),
                onTap: (){
                  _stopMove();
                  print("키");
                  Navigator.pushNamed(context, '/second');
                }
              ),
            ),
            Align(
              child: GestureDetector(
                child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: ad[0],
                  child: Container(
                    child: Image.asset('image/ggochi.png', height: 70,),
                    ),
                  ),
                onTap: (){
                  if (_checkFlag(0))
                    _setMove(0);
                  print("꼬치");},
                ),
              ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: ad[1],
                  child: GestureDetector(
                    child: Image.asset('image/bbang.png', height: 40,),
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
                    child: Image.asset('image/sangchu.png', height: 20,),
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
                    child: Image.asset('image/cheese.png', height: 20),
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
                    child: Image.asset('image/tomato.png', height: 20),
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
                    child: Image.asset('image/yangpa.png', height: 20),
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
                    child: Image.asset('image/gogi.png', height: 20),
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
                    child: Image.asset('image/bbang2.png', height: 20),
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
                    child: Image.asset('image/hamjung.png', height: 5),
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
