import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:english_words/english_words.dart';

class ScrollableWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ScrollableWidgetsState();
  }
}

class _ScrollableWidgetsState extends State<ScrollableWidgets> {
  var listWidgets = List.generate(
      100,
      (item) => Text(
            "i :$item",
            key: Key(item.toString()),
          ));

  var words = <String>["#Loading#"];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 100,
            child: CupertinoScrollbar(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Row(
                  children: listWidgets,
                ),
              ),
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
              itemBuilder: (context, index) {
                print("get index $index");
                return Column(
                  children: <Widget>[
                    Text("item $index 1"),
                    Text("item $index 2"),
                    Text("item $index 3")
                  ],
                );
              },
              itemExtent: 250,
            ),
          ),
//        加载更多的实现方式
          Container(
            height: 50,
            child: ListView.separated(
              itemBuilder: (context, index) {
                print("get index $index");
                if (words[index] == "#Loading#") {
                  if (words.length - 1 < 100) {
                    this._retriveData();
                    return SizedBox(
                      height: 20,
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return Text("没有更多了");
                  }
                } else {
                  return Column(
                    children: <Widget>[Text("item :${words[index]}")],
                  );
                }
              },
              separatorBuilder: (context, index) {
                return index % 2 == 0
                    ? Divider(
                        height: 1,
                        indent: 20,
                        endIndent: 20,
                        color: Colors.blue,
                      )
                    : Divider(
                        height: 1,
                        indent: 0,
                        color: Colors.red,
                      );
              },
              itemCount: words.length,
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white70),
            height: 200,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 2),
              children: <Widget>[
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.white70),
            height: 200,
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 50, childAspectRatio: 0.1),
              children: <Widget>[
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
                Icon(Icons.add),
              ],
            ),
          )

        ],
      ),
    );
  }

  _retriveData() {
    Future.delayed(Duration(seconds: 5)).then((value) {
      words.insertAll(words.length - 1,
          generateWordPairs().map((v) => v.asCamelCase).take(20));
      setState(() {});
    });
  }
}
