import 'package:flutter/material.dart';
import 'dart:ui';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Page1(),
    );
  }
}



class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> with TickerProviderStateMixin{
  // Animation<double> animation;
  // AnimationController animationController;
  List<int> temp = [0, 0, 0, 0, 0, 0, 0, 0];

  AlignmentDirectional _ggochiAlignment = AlignmentDirectional(0.0, -0.4);
  AlignmentDirectional _bbangAlignment = AlignmentDirectional(0.0, -0.2);
  AlignmentDirectional _sangchuAlignment = AlignmentDirectional(0.0, -0.1);
  AlignmentDirectional _cheeseAlignment = AlignmentDirectional(0.0, -0.05);
  AlignmentDirectional _tomatoAlignment = AlignmentDirectional(0.0, 0.0);
  AlignmentDirectional _yangpaAlignment = AlignmentDirectional(0.0, 0.05);
  AlignmentDirectional _gogiAlignment = AlignmentDirectional(0.0, 0.1);
  AlignmentDirectional _bbang2Alignment = AlignmentDirectional(0.0, 0.15);
  
  void _setGgochi(int a){
    setState(() {
      if (temp[a] == 0) {
        _ggochiAlignment = AlignmentDirectional(0.0, -0.7);
        temp[a] = 1;
      }
      else {
        _ggochiAlignment = AlignmentDirectional(0.0, -0.4);
        temp[a] = 0;
      }
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
                  alignment: _ggochiAlignment,
                  child: Container(
                    child: Image.asset('image/ggochi.png', height: 70,),
                    ),
                  ),
                onTap: (){ _setGgochi(temp[0]); print("꼬치"); print(temp[0]);},
                ),
              ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: _bbangAlignment,
                  child: GestureDetector(
                    child: Image.asset('image/bbang.png', width: 150),
                    onTap: (){
                      print("빵");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: _sangchuAlignment,
                  child: GestureDetector(
                    child: Image.asset('image/sangchu.png', width: 150),
                    onTap: (){
                      print("상추");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: _cheeseAlignment,
                  child: GestureDetector(
                    child: Image.asset('image/cheese.png', width: 150),
                    onTap: (){
                      print("치즈");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: _tomatoAlignment,
                  child: GestureDetector(
                    child: Image.asset('image/tomato.png', width: 150),
                    onTap: (){
                      print("토마토");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: _yangpaAlignment,
                  child: GestureDetector(
                    child: Image.asset('image/yangpa.png', width: 150),
                    onTap: (){
                      print("양파");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: _gogiAlignment,
                  child: GestureDetector(
                    child: Image.asset('image/gogi.png', width: 150),
                    onTap: (){
                      print("고기");
                    },
                  )
              ),
            ),
            Align(
              //alignment: AlignmentDirectional(0, 0.7),
              child: AnimatedContainer(
                  duration: Duration(seconds: 1),
                  alignment: _bbang2Alignment,
                  child: GestureDetector(
                    child: Image.asset('image/bbang2.png', width: 150),
                    onTap: (){
                      print("빵2");
                    },
                  )
              ),
            ),
          ],
        )
    );
  }

}
