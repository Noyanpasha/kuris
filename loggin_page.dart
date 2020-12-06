import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kur_iss/kayit_olma.dart';
import 'package:kur_iss/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';



 Future <void> main ()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(LoginPage());
}
class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {


  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  loginPaged() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginUp()));
  }
  signUp() {

    print(t1.text);
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: t1.text, password: t2.text)
        .then((user) {
      print(user);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ));
    }).catchError((e) {
      return showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text("Hata"),
          content: Text("Lütfen kullanıcı bilgilerinizi kontrol ediniz."),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.of(ctx).pop();
              },
              child: Text("Geri"),
            ),
          ],
        ),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightGreenAccent[400],
        title: Text("Kur-İş Hoşgeldiniz"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(500.0)),
                child: Image.asset("assets/kuris.png"),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: t1,
                decoration: InputDecoration(
                  fillColor: Colors.lightGreenAccent[100],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white54),
                  ),
                  labelText: "Kullanıcı girişi",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: t2,
                decoration: InputDecoration(
                  fillColor: Colors.lightGreenAccent[100],
                  filled: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightGreenAccent),
                  ),
                  labelText: "Şifre giriniz",
                  labelStyle: TextStyle(color: Colors.black),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(3.0)),
                ),
              ),
              Row(
                children: [
                  MaterialButton(
                      onPressed: () {}, child: Text("Şifremi unuttum")),
                  MaterialButton(
                    onPressed: () {
                      loginPaged();
                    },
                    child: Text("Kayıt ol"),
                  )
                ],
              ),
              RaisedButton(
                onPressed: () {
                  signUp();
                  t1.clear();
                  t2.clear();
                },
                child: Text("Giriş"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
