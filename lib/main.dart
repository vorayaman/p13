import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:p13/button.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Button(),
        '/myapp': (context) => Myapp(),
      },
    ),
  );
}

class Myapp extends StatefulWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  List alldata = [];

  getalldata() async {
    String res = await rootBundle.loadString("assets/json/data.json");
    var data = jsonDecode(res);

    setState(() {
      alldata = data['quotes'];
    });
  }

  animal() async {
    String res = await rootBundle.loadString("assets/json/animal.json");

    setState(() {
      alldata = jsonDecode(res);
    });
  }

  @override
  void initState() {
    super.initState();
    getalldata();
  }

  @override
  Widget build(BuildContext context) {
    dynamic p = ModalRoute.of(context)!.settings.arguments;

    if (p == 1) {
      getalldata();
    } else if (p == 2) {
      animal();
    } else if (p == 3) {
      getalldata();
    } else if (p == 4) {
      animal();
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
              child: Icon(Icons.arrow_back,color: Colors.black,)),
          centerTitle: true,
          title: Text(
            "FLUTTER APP",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.white,),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    shadowColor: Colors.yellow,
                    child: ListTile(
                      leading: Text("${i + 1}"),
                      title: Text("${alldata[i]['quote']}"),
                      subtitle: Text("${alldata[i]['author']}"),
                    ),
                  );
                },
                childCount: alldata.length,
              ),
            ),
          ],
        ),
        // body: Container(
        //   alignment: Alignment.center,
        //   child: Padding(
        //     padding: const EdgeInsets.all(10),
        //
        //
        //     // child: ListView.builder(
        //     //     itemCount: alldata.length,
        //     //     itemBuilder: (context, i) {
        //     //       return Card(
        //     //         elevation: 3,
        //     //         shadowColor: Colors.yellow,
        //     //         child: ListTile(
        //     //           title: Text("${alldata[i]['quote']}"),
        //     //           subtitle: Text("${alldata[i]['author']}"),
        //     //         ),
        //     //       );
        //     //     }),
        //   ),
        // ),
      ),
    );
  }
}
