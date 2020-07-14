import 'package:flutter/material.dart';
import 'package:android_htmleditor/android_htmleditor.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var html = '<b>Sample</b> Code';
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
                    setState(() {
                      html = _;
                    });
                  });
                }),
            Text(html),
          ],
        ),
      ),
    );
  }
}
