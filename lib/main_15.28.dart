import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body:  test(),
    );
  }

  final List<Widget> _pages = <Widget>[
    new FlutterLogo(textColor: Colors.blue),
    new FlutterLogo(style: FlutterLogoStyle.stacked, textColor: Colors.red),
    new FlutterLogo(style: FlutterLogoStyle.horizontal, textColor: Colors.green),
  ];

  Widget test(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new SizedBox(
        height: 300.0,
        child: Swiper(
            outer: true,
            scale:0.9,
            fade:0.8,
            viewportFraction: 0.8,
            itemBuilder: (c, i) {
              return new Container(
                color: Colors.grey,
                child: Text("$i"),
              );
            },
            pagination: new SwiperPagination(
                margin: new EdgeInsets.all(0.0),
                builder: new SwiperCustomPagination(builder:
                    (BuildContext context, SwiperPluginConfig config) {
                  return new Container(
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          child: new Align(
                            alignment: Alignment.center,
                            child: new DotSwiperPaginationBuilder(
                                color: Colors.black12,
                                activeColor: Colors.black,
                                size: 10.0,
                                activeSize: 20.0)
                                .build(context, config),
                          ),
                        ),
                        new Text(
                          " ${config.activeIndex + 1}/${config.itemCount}",
                          style: TextStyle(fontSize: 15.0),
                        ),
                      ],
                    ),
                    constraints: new BoxConstraints.expand(height: 50.0),
                  );
                })),
            itemCount: 10),
      ),
    );
  }
}
