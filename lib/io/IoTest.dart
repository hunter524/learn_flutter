import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class IoTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return IoState();
  }
}

class IoState extends State<IoTest> {
  String resp = "";
  String socketResp = "";
  IOWebSocketChannel _ioWebSocketChannel;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    目前只能通过wss协议进行WebSocket 链接
    _ioWebSocketChannel = IOWebSocketChannel.connect("wss://echo.websocket.org/");
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("IO Api Test"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text("send Http"),
              onPressed: () async {
//                使用dart自带的HttpClient的方式进行数据的请求
//                var httpClient = HttpClient();
//                HttpClientRequest httpReq = await httpClient.getUrl(Uri.parse("https://github.com"));
//                HttpClientResponse  httpClientResp =  await httpReq.close();
//                String respStr = await httpClientResp.transform(utf8.decoder).join();
//                setState(() {
//                  resp = respStr;
//                });

//              使用dio进行请求 (百度不设置UA无法请求到内容)
                var response = await Dio().get("https://www.baidu.com",
                    options: Options(headers: {
                      "User-Agent":
                          "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/76.0.3809.87 Safari/537.36"
                    }), onReceiveProgress: (count, total) {
                  print("count $count total $total");
                });
                setState(() {
                  resp = response.data.toString();
                });
              },
            ),
            Text("Http Resp:\n$resp"),
            FlatButton(
              child: Text("Send Wss"),
              onPressed: (){
                _ioWebSocketChannel.sink.add("Bar Time: ${DateTime.now().toIso8601String()}");
              },
            ),
            StreamBuilder(
              stream: _ioWebSocketChannel.stream,
              builder: (context, snapshot) {
                print(snapshot);
                if(snapshot.hasData){
                  return Text("Data: ${snapshot.data}");
                }
                else{
                  return Text("Nodata");
                }
              },
            ),
//            百度需要https 因此使用websocket.org 测试http请求
            FlatButton(
              child: Text("Send Socket"),
              onPressed: () async {
                var socket = await Socket.connect("websocket.org", 80);
                socket.writeln("GET / HTTP/1.1");
                socket.writeln("Host:websocket.org");
                socket.writeln("Connection:close");
                socket.writeln();
                await socket.flush();
                var content = await socket.transform(utf8.decoder).join();
                setState(() {
                  socketResp = content;
                });
                socket.close();

              },
            ),
            Text("Socket Resp:\n$socketResp"),
            FlatButton(
              child: Text("Send Socket"),
              onPressed: () async {
                String jsonStr = '[{"name":"Jack","email":"123@123.com"},{"name":"Rose","email":"456@456.com"}]';

                var listPerson = json.decode(jsonStr);

                print(listPerson[0]['name']);
              },
            ),
          ],
        ),
      ),
    );
  }
}
