import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() {
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ur', 'PK')],
      path: 'translate', // <-- change patch to your
      fallbackLocale: Locale('en', 'US'), //when locale not in list
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("title").tr(),
      ),
      drawer: Drawer(),
      body: Container(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                onPressed: () {
                  context.locale = Locale('en', 'US');
                },
                child: Text("Button1").tr(),
              ),
              Text("Text").tr(),
              RaisedButton(
                onPressed: () {
                  context.locale = Locale('ur', 'PK');
                },
                child: Text("Button2").tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
