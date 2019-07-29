import 'package:flutter/material.dart';

class ScrollControllerWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _StateScrollController();
  }
}

class _StateScrollController extends State<ScrollControllerWidgets> {
  ScrollController _scrollController = ScrollController();
  bool showGoUp = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      print(
          "call ScrollController Listener offset ${_scrollController.offset} scroll able widgets:${_scrollController.positions.toList().length}");
      if (_scrollController.offset < 1000 && showGoUp) {
        setState(() {
          showGoUp = false;
        });
      } else if (_scrollController.offset > 1000 && !showGoUp) {
        setState(() {
          showGoUp = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            padding: EdgeInsets.all(24),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Text("Item ${index}");
              },
              itemCount: 100,
              itemExtent: 50,
              controller: _scrollController,
            ),
          ),

          Container(
            height: 300,
            padding: EdgeInsets.all(24),
            child: Scrollbar(
              child: NotificationListener<ScrollNotification>(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return Text("Item ${index}");
                  },
                  itemCount: 100,
                  itemExtent: 50,
                ),
                onNotification: (notification){
                  var metrics = notification.metrics;
                  print("List 2 BeforeExtent ${metrics.extentBefore}");
                  return false;
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: showGoUp
          ? FloatingActionButton(
              onPressed: () {
                _scrollController.animateTo(0.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease);
              },
              child: Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
