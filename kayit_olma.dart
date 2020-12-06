import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kur_iss/main_screen.dart';

Future <void> main ()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp());

/*void main() => runApp(MaterialApp());*/
}

class LoginUp extends StatefulWidget {
  @override
  _LoginUpState createState() => _LoginUpState();
}

class _LoginUpState extends State<LoginUp> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  TextEditingController t3 = TextEditingController();
  TextEditingController t4 = TextEditingController();
  TextEditingController t5 = TextEditingController();

  registerMe()
    async{
      FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: t4.text, password: t5.text).then((value){
       FirebaseFirestore.instance.collection("Users").doc(t4.text).set({
         "İsim":t1.text,"Soyisim": t2.text, "Tel No": t3.text, "Email":t4.text, "Şifre":t5.text
       });
      }).whenComplete(() => Navigator.push(
          context,
          MaterialPageRoute(
          builder: (context) => MainScreen(),
          )
      ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent[400],
          title: Text("Kayıt ol"),
        ),
        body: Center(
            child: Padding(
              padding: const EdgeInsets.all(60.0),
              child: SingleChildScrollView(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: 40.0,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.lightGreenAccent[700],
                        radius: 50,
                        child: Text("Kuriş")
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(

                      controller: t1,
                      decoration: InputDecoration(
                        fillColor: Colors.lightGreenAccent[100],
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                        labelText: "İsim",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0)),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: t2,
                      decoration: InputDecoration(
                        fillColor: Colors.lightGreenAccent[100],
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                        labelText: "Soyisim",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0)),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: t3,
                      // ignore: deprecated_member_use
                      autovalidate: true,
                      keyboardType: TextInputType.number,
                      // ignore: deprecated_member_use
                      inputFormatters: [
                        // ignore: deprecated_member_use
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        fillColor: Colors.lightGreenAccent[100],
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                        labelText: "Telefon No",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0)),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: t4,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        fillColor: Colors.lightGreenAccent[100],
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                        labelText: "Mail Adresi",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0)),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    TextFormField(
                      controller: t5,
                      decoration: InputDecoration(
                        fillColor: Colors.lightGreenAccent[100],
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white54),
                        ),
                        labelText: "Şifre",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(3.0)),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      onPressed: registerMe,
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreenAccent[400],
                          onPrimary: Colors.black,
                          onSurface: Colors.black,
                          textStyle: TextStyle(
                            color: Colors.black,
                          )),
                      child: Text("Kayıt"),
                    ),
                  ],
                ),
              ),
            )
        )
    );
  }

}