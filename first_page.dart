
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main()=>runApp (MaterialApp());
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}
class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("Hoşgeldiniz"),
          backgroundColor: Colors.lightGreenAccent[400]
      ),
      body: Padding(
        padding: const EdgeInsets.all(80.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:<Widget> [
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(500.0)),
                child: Image.asset("assets/kuris.png"),
              ),
              SizedBox(height:50 ,),
              RaisedButton(
                  child: Text("İş Arayan"),
                  onPressed: ()=> Navigator.pushNamed(context, '/sayfa2')
              ),
              RaisedButton(
                  child: Text("İş Veren"),
                  onPressed: (){}
                // => Navigator.pushNamed(context, '/sayfa2')
              )
            ],
          ),
        ),
      ),
    );
  }
}
