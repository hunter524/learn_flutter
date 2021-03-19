import 'dart:io';
import 'dart:ui';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/Animations.dart';
import 'package:flutter_app/widgets/ContainerWidgets.dart';
import 'package:flutter_app/widgets/CupertinoWidget.dart';
import 'package:flutter_app/widgets/FormWidgets.dart';
import 'package:flutter_app/widgets/FunctionWidgets.dart';
import 'package:flutter_app/widgets/ScrollControllerWidgets.dart';
import 'package:flutter_app/widgets/ScrollableWidgets.dart';
import 'package:flutter_app/widgets/TouchEventHandler.dart';
import 'package:flutter_app/widgets/WrapFlow.dart';
import 'package:path_provider/path_provider.dart';

import 'class.dart';
import 'grade.dart';
import 'io/IoTest.dart';
import 'lifecyclewidget/lifecylewidget.dart';

void main() {
//  复杂的实现
//  runZoned(() => runApp(MyApp()), zoneSpecification: ZoneSpecification(
//      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
//    parent.print(zone, "Intercepted: $line");
//  }));
// 替换成简单的实现
runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("MyApp build!");
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        'class': (context) {
          print("call class builder from main.dart $context");
          return Class();
        },
        'lifecycle': (context) {
          return LifeCycleWidget();
        },
        'cupertino': (context) {
          return CupertinoUiFoo();
        },
//        'somewidgets': (context) {
//          return SomeWidgets();
//        },
        'formwidget': (context) {
          return FormWidgets();
        },
        'wrapflow': (context) {
          return WrapFlow();
        },
        'containerwidgets': (context) {
          return ContainerWidgets();
        },
        'scrollablewidgets': (context) {
          return ScrollableWidgets();
        },
        'scrollcontrollerwidgets': (context) {
          return ScrollControllerWidgets();
        },
        'functionwidgets': (context) {
          return FunctionWidgets();
        },
        'toucheventhandler': (context) {
          return TouchEventHandler();
        },
        'animationwidgets': (context) {
          return AnimationWidgets();
        },
        'iotest': (context) {
          return IoTest();
        }
      },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:
          MyHomePage(key: ValueKey("home"), title: 'Flutter Demo Home Page 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() {
//    dart 语法测试
    print("key is :${this.key}");
    dynamic a = "aaa";
    var str = "Str";
    print("a length is ${a.length}");
    a = 111;
    print("a is ${a} without length");
    print("str ${str.codeUnitAt(0)}");

    return _MyHomePageState();
  }

  int loopInfinity() {
    int sum = 0;
    for (int i = 0; i < 100000000000; i++) {
      sum = sum + i;
    }
    return sum;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState()  {
    print("call init state");

    super.initState();
//    Future.delayed(Duration(seconds: 5), () {
//      return "hello";
//    }).then((result) {
//      setState(() {
//        _counter = _counter + 5;
//      });
//    });

    getApplicationSupportDirectory().then((filePath){
      var file = File("${filePath.path}/counter.txt");
      if(!file.existsSync()){
        print("file not exist");
        return;
      }
      var counter = file.readAsStringSync();
      setState(() {
        _counter = int.parse(counter);
      });
    });

  }

  void _incrementCounter() async {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
//      以下三个均为内置存储目录 (!!! 同时调用多次会报错!!!)
//      内置存储目录下的 app_flutter 目录
//      getApplicationDocumentsDirectory().then((data) {
//        print("data: ${data.path}");
//      });
//
//      getApplicationSupportDirectory().then((file){
//        print("file: ${file.path}");
//      });
//
//      getTemporaryDirectory().then((cache){
//        print("cache: ${cache.path}");
//      });
////外部存储目录的files
//      getExternalStorageDirectory().then((externfile){
//        print("external file: ${externfile.path}");
//      });
    });

    var filePath = (await getApplicationSupportDirectory()).path;
    var file = File("$filePath/counter.txt");
    await file.writeAsString(_counter.toString(),flush: true);
    print("writeScuccess");
  }

  @override
  Widget build(BuildContext context) {
    print("${window.viewInsets},${window.viewPadding},${window.devicePixelRatio}\n${window.physicalSize}");
//
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var wordPair = WordPair.random();

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
        BottomNavigationBarItem(
            icon: Icon(Icons.business), title: Text("Business"))
      ]),

      endDrawer: Drawer(
        child: Text("DrawerLabel"),
        semanticLabel: "Label",
      ),

      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              // Column is also layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Invoke "debug painting" (press "p" in the console, choose the
              // "Toggle Debug Paint" action from the Flutter Inspector in Android
              // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
              // to see the wireframe for each widget.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(width: 399,height:200,decoration: BoxDecoration(color: Colors.blue),),

                Text(
                  'You have pushed the button this many times:Instant!',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
                Text(
                  '随机单词:$wordPair',
                  style: Theme.of(context).textTheme.body1,
                ),
//            FlatButton(onPressed:(){
//              print("flat button on Pressed! ddd");
//            },
//              child: Image(image: AssetImage("assets/index.png"),height: 400,width: 400,fit: BoxFit.contain,),),

//            FadeInImage(placeholder:AssetImage("assets/index.png"),image:AssetImage("assets/index.png"),width: 400,height: 200,),

                MaterialButton(
                  child: Text("Go To One Grade!"),
                  onPressed: () {
                    Navigator.push(context,
                        new CupertinoPageRoute(builder: (context) {
                      return new Grade();
                    })).then((returnVar) {
                      print("Value Return From The Grade: $returnVar");
                    });
                  },
                ),
                MaterialButton(
                  child: Text("Go To LifeCycle!"),
                  onPressed: () {
                    Navigator.pushNamed(context, "lifecycle");
                  },
                ),
                MaterialButton(
                  child: Text("Go To Cupertino!"),
                  onPressed: () {
                    Navigator.pushNamed(context, "cupertino");
                  },
                ),
                MaterialButton(
                  child: Text("Go To Somewidgets!"),
                  onPressed: () {
                    Navigator.pushNamed(context, "somewidgets");
                  },
                ),
                MaterialButton(
                  child: Text("Go To FormWidget!"),
                  onPressed: () {
                    Navigator.pushNamed(context, "formwidget");
                  },
                ),
                MaterialButton(
                  child: Text("Go To WrapFlow!"),
                  onPressed: () {
                    Navigator.pushNamed(context, "wrapflow");
                  },
                ),
                MaterialButton(
                  child: Text("Go To ContainerWidgets!"),
                  onPressed: () {
                    Navigator.pushNamed(context, "containerwidgets");
                  },
                ),
                MaterialButton(
                  child: Text("Go To ScrollableWidgets!"),
                  onPressed: () {
                    Navigator.pushNamed(context, "scrollablewidgets");
                  },
                ),
                MaterialButton(
                  child: Text("Go To ScrollController!"),
                  onPressed: () {
                    Navigator.pushNamed(context, "scrollcontrollerwidgets");
                  },
                ),

                MaterialButton(
                  child: Text("Go To FunctionWidgets!"),
                  onPressed: () {
                    Navigator.pushNamed(context, "functionwidgets");
                  },
                ),

                MaterialButton(
                  child: Text("Go To TouchEventHandler!"),
                  onPressed: () {
                    Navigator.pushNamed(context, "toucheventhandler");
                  },
                ),
                MaterialButton(
                  child: Text("Go To AnimationWidgets!"),
                  onPressed: () {
                    Navigator.pushNamed(context, "animationwidgets");
                  },
                ),
                MaterialButton(
                  child: Text("Go To IoTest!"),
                  onPressed: () {
                    Navigator.pushNamed(context, "iotest");
                  },
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
