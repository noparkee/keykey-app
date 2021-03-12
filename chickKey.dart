import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'dart:ui';

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> with TickerProviderStateMixin{
  /*List<AlignmentDirectional> ad = [AlignmentDirectional(0.0, 0.0),  //chicken
                                    AlignmentDirectional(0.0, -0.43),   //top
                                    AlignmentDirectional(0.0, 0.43),    // bottom
                                    AlignmentDirectional(-0.55, 0.0), AlignmentDirectional(0.55, 0.0), // left, right
                                    AlignmentDirectional(0.0, 0.0),]; // mid
   */


  List<AlignmentDirectional> etcAd = [AlignmentDirectional(-0.5, 0.6),   // top
                                    AlignmentDirectional(0.3, 0.65),   // bottom
                                    AlignmentDirectional(-0.7, 0.5), AlignmentDirectional(0.6, 0.6),  // left, right
                                    AlignmentDirectional(0.2, 0.55)];  // mid

  AlignmentDirectional _eggFri = AlignmentDirectional(0.0, 0.0);
  AlignmentDirectional _touchPad = AlignmentDirectional(0.0, 0.0);
  AlignmentDirectional _key = AlignmentDirectional(0.0, 0.2);
  AlignmentDirectional _exit = AlignmentDirectional(0.9, 0.4);    // 키를 터치할 수 있는 위치

  List<double> positionX = [-0.55, 0.55];   // left right
  List<double> positionY = [-0.5, 0.5];     // top bottom
  bool touch = false;   // 10초 전에 터치했는지 아닌지 판단
  bool keyTouch = false;    //
  bool exitTouch = false;

  int touchnum = 0;
  int chick = 0;

  var start = DateTime.now();

  AnimationController _controller;
  double _scale = 1;
  @override

  initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
      lowerBound: 1.0,
      upperBound: 3.0,
    );

    _controller.addListener(() {
        setState(() {
          _scale = _controller.value;
        });
        if (_controller.isCompleted)
          exitTouch = true;
    });
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool _checkChickhNum(){
    if (chick >= 50){
      return true;
    }
    else
      return false;
  }

  void _moveKey(){
    setState(() {
      _key = AlignmentDirectional(0.9, 0.4);
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
    if (exitTouch == false){
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
      else if (touchnum < 50){
        return Scaffold(
          body: Stack(
            children: <Widget>[
              Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: Image.asset('image/byeongariset/chicken.png',)   //  병아리
              ),

              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: AnimatedOpacity(
                    opacity: touchnum >= 50 ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 30),
                    child: GestureDetector(
                      child: Image.asset('image/byeongariset/eggR.png',),     //  Right 부저신 달걀
                      onTap: (){
                        touchnum += 1;
                      },
                    )
                ),
              ),
              Align(
                  alignment: etcAd[3],
                  child: AnimatedOpacity(
                    opacity: touchnum >= 40 ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 30),
                    child: Image.asset('image/byeongariset/eggEtc.png',),
                  )
              ),

              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: AnimatedOpacity(
                    opacity: touchnum >= 40 ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 30),
                    child: GestureDetector(
                      child: Image.asset('image/byeongariset/eggL.png',),     //  Left 부저신 달걀
                      onTap: (){
                        touchnum += 1;
                      },
                    )
                ),
              ),
              Align(
                  alignment: etcAd[2],
                  child: AnimatedOpacity(
                    opacity: touchnum >= 30 ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 30),
                    child: Image.asset('image/byeongariset/eggEtc.png',),
                  )
              ),

              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: AnimatedOpacity(
                    opacity: touchnum >= 30 ? 0.0 : 1.0,
                    duration: Duration(milliseconds: 30),
                    child: GestureDetector(
                      child: Image.asset('image/byeongariset/eggBot.png',),     //  Bottom 부저신 달걀
                      onTap: (){
                        touchnum += 1;
                      },
                    )
                ),
              ),
              Align(
                  alignment: etcAd[1],
                  child: AnimatedOpacity(
                    opacity: touchnum >= 20 ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 30),
                    child: Image.asset('image/byeongariset/eggEtc.png',),
                  )
              ),

              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: AnimatedOpacity(
                  opacity: touchnum >= 20 ? 0.0 : 1.0,
                  duration: Duration(milliseconds: 30),
                  child: GestureDetector(
                    child: Image.asset('image/byeongariset/eggTop.png',),     //  Top 부저신 달걀
                    onTap: (){
                      touchnum += 1;
                    },
                  )
                ),
              ),
              Align(
                alignment: etcAd[0],
                child: AnimatedOpacity(
                  opacity: touchnum >= 10 ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 30),
                  child: Image.asset('image/byeongariset/eggEtc.png',),
                )
              ),

              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: AnimatedOpacity(
                  opacity: touchnum >= 10 ? 0.0 : 1.0,
                  duration: Duration(milliseconds: 30),
                  child: GestureDetector(
                    child: Image.asset('image/byeongariset/egg.png',),      // 온전한 달걀
                    onTap: (){
                      if (touch && touchnum == 2) {
                        Navigator.pushReplacementNamed(context, '/second');
                      }
                      else if (touch && touchnum < 2)
                        touchnum += 1;
                      else{
                        var now = DateTime.now();
                        setState(() {
                          if (now.difference(start) < Duration(seconds: 1)){      // ***** 수정하기 *****
                            print("Touch before 10 sec");
                            touch = true;
                          }
                          else
                            touch = false;
                        });   // End setState

                        touchnum += 1;
                        //touchTop += 1;
                      }
                    },
                  ),
                )
              ),
            ],
          )
        );
      }

      else  // 껍질 다 부신 상황
        return Scaffold(
          body: Stack(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(seconds: 1),
                alignment: _key,
                child: GestureDetector(
                    child: Transform.scale(
                      scale: _scale,
                      child: Image.asset('image/key.png',),),
                    onTap: (){
                    }
                ),
              ),

              AnimatedContainer(
                  duration: Duration(seconds: 0),
                  alignment: AlignmentDirectional(0, 0),
                  child: GestureDetector(
                      child: Image.asset('image/byeongariset/chicken.png',),
                      onTap: (){
                        chick += 1;
                        if (_checkChickhNum() && keyTouch == false) {
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
                      duration: Duration(milliseconds: 1),
                      child: Transform.scale(
                        scale: _scale,
                        child: Image.asset('image/key2.png'),
                      ),
                    ),
                    onTap: (){
                      chick += 1;
                      if (_checkChickhNum()){
                        keyTouch = true;
                        _exitStage();
                        _controller.forward();
                      }

                      print(exitTouch);
                    }
                ),
              )

            ]
          ),
        );
    }
    else{   // 최종 탈출
      return Scaffold(
        body: Stack(
            children: <Widget>[
              Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Image.asset('image/byeongariset/chicken.png',),
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

              Align(
                alignment: _exit,
                child: GestureDetector(
                    child: Transform.scale(
                      scale: _scale,
                      child: Image.asset('image/key.png'),
                    ),
                    onTap: (){
                      print(exitTouch);
                      print("exit");
                      // 여기서 키 누르면 화면 전환 되게 해야해
                    }
                ),
              )
            ]
        ),
      );
    }
  }
}