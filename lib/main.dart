import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    this.decodeData();
  }

  List data;

  Future<String> decodeData() async {
    http.Response response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/users"),
        headers: {"Accept": "application/json"});
    this.setState(() {
      data = json.decode(response.body);
    });
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JsonDecode Example")),
      body: data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  color: Colors.red[100],
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text("Name:   " + data[index]["name"]),
                        ),
                        Container(
                          child: Text("Username:   " + data[index]["username"]),
                        ),
                        Container(
                          child: Text("Email:   " + data[index]["email"]),
                        ),
                        Container(
                          child: Text(
                              "Address:   " + data[index]["address"]["street"]),
                        ),
                        Container(
                          child: Text("Contact:   " + data[index]["phone"]),
                        ),
                        Container(
                          child: Text("Website:   " + data[index]["website"]),
                        ),
                        Container(
                          child: Text("Company name:   " +
                              data[index]["company"]["name"]),
                        ),
                      ],
                    ),
                  ),
                );
              }),
              backgroundColor: Colors.lightBlue,
              bottomNavigationBar: BottomAppBar(
        child:Text("Built by @TS❤️",textAlign: TextAlign.center, style:TextStyle(fontWeight: FontWeight.bold,fontSize: 15,),),
       color:Colors.blue[200]
      ),
    );
  }
}
