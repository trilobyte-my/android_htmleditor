import 'package:flutter/material.dart';
import 'package:android_htmleditor/android_htmleditor.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String html;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('HTML Editor'),
        ),
        body: ListView(
          children: <Widget>[
            RaisedButton(
                child: Text('EDITOR'),
                onPressed: () {
                  AndroidHtmleditor.edit(html).then((_) {
                    print(_);
                    if (_ != null) {
                      setState(() {
                        html = _;
                      });
                    }
                  }).catchError((_) {
                    //
                  });
                }),
            Text(html ?? ''),
          ],
        ),
      ),
    );
  }
}
