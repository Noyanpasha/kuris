import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



void main() => runApp(MainScreen());

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    ProfilPage(),
    OzGecmis(),
    IsArama(),
  ];
  @override
    Widget build(BuildContext context) {
      return Scaffold(

          backgroundColor: Colors.white70,
          bottomNavigationBar: BottomNavigationBar(

            unselectedItemColor: Colors.black,
            selectedItemColor:Colors.amberAccent,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profil',
              ),
              BottomNavigationBarItem(
                backgroundColor: Colors.amberAccent,
                icon: Icon(Icons.assignment),
                label: 'Özgeçmiş',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.where_to_vote_outlined),
                label: 'Yakınlarda iş ara',
              ),
            ],
            onTap: (index) {
              setState(() {

                _selectedIndex = index;
              });
            },
          ),


          appBar: AppBar(
              automaticallyImplyLeading: false,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.backspace),
                  onPressed: () =>
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/',
                        ModalRoute.withName('/'),
                      ),
                )
              ],
              backgroundColor: Colors.lightGreenAccent[400],
              title: Text("Ana Sayfaya Hoşgeldiniz")),
          body: _widgetOptions.elementAt(_selectedIndex),
          );
    }
  }

// ignore: must_be_immutable
class ProfilPage extends StatelessWidget {
  Stream collectionStream = FirebaseFirestore.instance.collection('Users').snapshots();
  Stream documentStream = FirebaseFirestore.instance.collection('Users').doc('Email').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
         backgroundColor: Colors.white24,
          automaticallyImplyLeading: false,
          title: Text("Profilim"),
      ),
      body: GetUserName("Email"),
    );
  }
}

class OzGecmis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(
        backgroundColor: Colors.white24,
        automaticallyImplyLeading: false,
        title: Text("Özgeçmişim"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children:<Widget> [
            ],

          ),
        ),
      ),
    );
  }
}

class IsArama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class GetUserName extends StatelessWidget {
  final String eMail;

  GetUserName(this.eMail);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(eMail).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Full Name: ${data['İsim']} ${data['Soyisim']}");
        }

        return Text("loading");
      },
    );
  }
}