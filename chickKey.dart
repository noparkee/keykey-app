import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with TickerProviderStateMixin{
  List<AlignmentDirectional> ad = [AlignmentDirectional(0.0, 0.0),  //chicken
                                    AlignmentDirectional(0.0, -0.43),   //top
                                    AlignmentDirectional(0.0, 0.43),    // bottom
                                    AlignmentDirectional(-0.55, 0.0), AlignmentDirectional(0.55, 0.0), // left, right
                                    AlignmentDirectional(0.0, 0.0),]; // mid


  List<AlignmentDirectional> etcAd = [AlignmentDirectional(-0.5, 0.6),   // top
                                    AlignmentDirectional(0.3, 0.65),   // bottom
                                    AlignmentDirectional(-0.7, 0.5), AlignmentDirectional(0.6, 0.6),  // left, right
                                    AlignmentDirectional(0.2, 0.55)];  // mid

  AlignmentDirectional _eggFri = AlignmentDirectional(0.0, 0.0);
  AlignmentDirectional _touchPad = AlignmentDirectional(0.0, 0.0);
  AlignmentDirectional _key = AlignmentDirectional(0.0, 0.2);
  AlignmentDirectional _exit = AlignmentDirectional(0.0, 0.2);    // 키를 터치할 수 있는 위치

  List<double> positionX = [-0.55, 0.55];   // left right
  List<double> positionY = [-0.5, 0.5];     // top bottom
  bool touch = false;
  bool keyTouch = false;

  int touchnum = 0;

  var start = DateTime.now();

  bool _checkTouchNum(){
    print(touchnum);
    if (touchnum > 100){
      return true;
    }
    else
      return false;
  }

  void _moveKey(){
    setState(() {
      _key = AlignmentDirectional(0.9, 0.4);
      _exit = AlignmentDirectional(0.9, 0.4);
    });
  }

  void _exitStage(){
    setState(() {
      _key = AlignmentDirectional(0.0, 0.0);
      _exit = AlignmentDirectional(0.0, 0.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (touch)  // 10초 이내에 계란 터치 했을 때
      return Scaffold(
        body: Align(
            alignment: _eggFri,
            child: GestureDetector(
                child: Image.asset('image/byeongariset/eggFri.png',),
                onTap: (){
                  Navigator.pushReplacementNamed(context, '/second');
                }
            )
        ),
      );

    else if (touchnum < 50)   // 달걀 껍질 깨지는 부분
      return Scaffold(
          body: Stack(
            children: <Widget>[
              Align(
                  alignment: ad[0],
                  child: Image.asset('image/byeongariset/chicken.png',)
              ),

              AnimatedContainer(    // TOP
                  duration: Duration(milliseconds: 150),
                  alignment: ad[1],
                  child: AnimatedOpacity(
                    opacity: touch || touchnum > 10 ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 150),
                    child: Image.asset('image/byeongariset/eggTop.png',),
                  )
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  alignment: etcAd[0],
                  child: AnimatedOpacity(
                    opacity: touchnum > 10 ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: Image.asset('image/byeongariset/eggEtc.png',),
                  )
              ),

              AnimatedContainer(    // BOTTOM
                  duration: Duration(milliseconds: 150),
                  alignment: ad[2],
                  child: AnimatedOpacity(
                    opacity: touch ||  touchnum > 20 ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 150),
                    child: Image.asset('image/byeongariset/eggBot.png',),
                  )
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  alignment: etcAd[1],
                  child: AnimatedOpacity(
                    opacity: touchnum > 20 ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: Image.asset('image/byeongariset/eggEtc.png',),
                  )
              ),

              AnimatedContainer(    // LEFT
                  duration: Duration(milliseconds: 150),
                  alignment: ad[3],
                  child: AnimatedOpacity(
                    opacity: touch || touchnum > 30 ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 150),
                    child: Image.asset('image/byeongariset/eggCol.png',),
                  )
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  alignment: etcAd[2],
                  child: AnimatedOpacity(
                    opacity: touchnum > 30 ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: Image.asset('image/byeongariset/eggEtc.png',),
                  )
              ),

              AnimatedContainer(    // RIGHT
                  duration: Duration(milliseconds: 150),
                  alignment: ad[4],
                  child: AnimatedOpacity(
                    opacity: touch || touchnum > 40 ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 150),
                    child: Image.asset('image/byeongariset/eggCol.png',),
                  )
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  alignment: etcAd[3],
                  child: AnimatedOpacity(
                    opacity: touchnum > 40 ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: Image.asset('image/byeongariset/eggEtc.png',),
                  )
              ),

              AnimatedContainer(    // MID
                  duration: Duration(milliseconds: 150),
                  alignment: ad[5],
                  child: AnimatedOpacity(
                    opacity: touch || touchnum > 50 ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 150),
                    child: Image.asset('image/byeongariset/eggMid.png',),
                  )
              ),
              AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  alignment: etcAd[4],
                  child: AnimatedOpacity(
                    opacity: touchnum > 50 ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 300),
                    child: Image.asset('image/byeongariset/eggEtc.png',),
                  )
              ),



              AnimatedContainer(
                duration: Duration(seconds: 1),
                alignment: _touchPad,
                child: GestureDetector(
                  child: Image.asset('image/byeongariset/touchpad.png'),
                  onTap: () {
                    if (touch && touchnum == 2) {
                      Navigator.pushReplacementNamed(context, '/second');
                    }
                    else if (touch && touchnum < 2)
                      touchnum += 1;
                    else{
                      var now = DateTime.now();
                      setState(() {
                        if (now.difference(start) < Duration(seconds: 10)){
                          print("Touch before 10 sec");
                          touch = true;
                        }
                        else
                          touch = false;
                      });   // End setState

                      touchnum += 1;
                    }
                  },
                ),
              ),
            ],
          )
      );

    else if (touchnum >= 50)    // 계란 껍질은 다 까진 상태 + 병아리 계속 누르면 키 나옴
      return Scaffold(
          body: Stack(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(seconds: 1),
                alignment: _key,
                child: GestureDetector(
                    child: AnimatedOpacity(
                      opacity: keyTouch ? 0.0 : 1.0,
                      duration: Duration(seconds: 1),
                      child: Image.asset('image/byeongariset/key.png',),),
                    onTap: (){
                      _exitStage();
                    }
                ),
              ),


              AnimatedContainer(
                  duration: Duration(seconds: 0),
                  alignment: ad[0],
                  child: GestureDetector(
                      child: Image.asset('image/byeongariset/chicken.png',),
                      onTap: (){
                        touchnum += 1;
                        if (_checkTouchNum()) {
                          _moveKey();
                        }
                      }
                  )
              ),


              Align(
                alignment: etcAd[0],
                child: Image.asset('image/byeongariset/eggEtc.png',),
              ),
              Align(
                alignment: etcAd[1],
                child: Image.asset('image/byeongariset/eggEtc.png',),
              ),
              Align(
                alignment: etcAd[2],
                child: Image.asset('image/byeongariset/eggEtc.png',),
              ),
              Align(
                alignment: etcAd[3],
                child: Image.asset('image/byeongariset/eggEtc.png',),
              ),
              Align(
                alignment: etcAd[4],
                child: Image.asset('image/byeongariset/eggEtc.png',),
              ),


              AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: _exit,
                  child: GestureDetector(
                      child: AnimatedOpacity(
                        opacity: keyTouch ? 1.0 : 0.0,
                        duration: Duration(seconds: 1),
                        child: Image.asset('image/byeongariset/key.png',),),
                        onTap: (){
                          _exitStage();
                          keyTouch = true;
                        }
                      ),
              ),
            ],
          )
      );


  }
}