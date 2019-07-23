import 'package:flutter/material.dart';

class FormWidgets extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormWidgetsState();
  }
}

class FormWidgetsState extends State<FormWidgets> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          Form(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration:
                      InputDecoration(hintText: "邮箱账号", /*labelText: "账号"*/),
                  validator: (v) {
                    return v.trim().length > 5 ? null : "账号大于5";
                  },
                ),
                TextFormField(
                  decoration:
                      InputDecoration(hintText: "邮箱密码", labelText: "密码"),
                  validator: (v) {
                    return v.trim().length > 6 ? null : "密码大于6";
                  },
                ),
                Builder(
                  builder: (context) {
                    return RaisedButton(
                      child: Text("提交"),
                      onPressed: () {
                        if (Form.of(context).validate()) {
                          print("验证成功,提交");
                        }
                      },
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
