import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({Key? key}) : super(key: key);

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          centerTitle: true,
          title: Text("QUOTE APP",style: TextStyle(color: Colors.black),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/myapp', arguments: 1);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),
                  child: Text("Motivational",style: TextStyle(color: Colors.black),),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/myapp', arguments: 2);
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.white),

                  child: Text("     Animal     ",style: TextStyle(color: Colors.black),),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/myapp',arguments: 3);
                  },                  style: ElevatedButton.styleFrom(primary: Colors.white),

                  child: Text(" information ",style: TextStyle(color: Colors.black),),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/myapp',arguments: 4);

                  },                  style: ElevatedButton.styleFrom(primary: Colors.white),

                  child: Text(" Sad Qutoes ",style: TextStyle(color: Colors.black),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
