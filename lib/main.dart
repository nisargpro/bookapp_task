import 'package:flutter/material.dart';
import 'dart:async';
import 'package:bookapp_task/http_api.dart';
import 'package:bookapp_task/http_model.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Post> data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = Network().getpost();
    data.then((value)  {
      print(value.clients[0].name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("api test"),
      ),
      body: Center(
        child: Container(
          child: FutureBuilder(
              future: Network().getpost(),
              builder: (context ,AsyncSnapshot<Post> snapshot){
                if(snapshot.hasData){
                  return createListView(snapshot.data!.clients, context);
                  //return Text(snapshot.data!.data[0].id.toString());
                }
                return CircularProgressIndicator();

              }),
        ),
      ),
    );
  }

  Widget createListView(List<Clients> data, BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, int index){
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: ListTile(
                    title: Text("${data[index].name}"),
                    subtitle: Text("${data[index].company}")
                  ),
                )
              ],
            );
          }),
    );
  }
}
