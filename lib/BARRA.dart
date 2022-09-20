import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  final ScrollController _firstController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Row(
            children: <Widget>[
              SizedBox(
                  width: constraints.maxWidth / 2,
                  child: Scrollbar(
                    thumbVisibility: true,
                    controller: _firstController,
                    child: ListView.builder(
                        controller: _firstController,
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Scrollable 1 : Index $index'),
                          );
                        }),
                  )),
              SizedBox(
                  width: constraints.maxWidth / 2,
                  child: Scrollbar(
                    thumbVisibility: true,
                    child: ListView.builder(
                        primary: true,
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              height: 50,
                              color: index.isEven
                                  ? Colors.amberAccent
                                  : Colors.blueAccent,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('Scrollable 2 : Index $index'),
                              ));
                        }),
                  )),
            ],
          );
        });
  }
}