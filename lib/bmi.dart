import 'package:flutter/material.dart';
import './about/about_view.dart';
import 'bmi_result.dart';
import 'HitungKubus.dart';
import '/src/app.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData.light(),
  home: InputBMI(),
));

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;

  String jenisKelamin;
  String tanggalLahir;
  String umur;

  var username = new TextEditingController();
  var gender = new TextEditingController();
  var dateborn = new TextEditingController();
  var agenumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[400],
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.greenAccent[700],
            ),
            onPressed: () {},
          ), // IconButton
        ],
        title: Text('MENGHITUNG BMI'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset(
                  'images/BMI.jpg',width:225,height:225),
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (txt) {
                          setState(() {
                            tinggi = int.parse(txt);
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                            suffix: Text('cm'),
                            fillColor: Colors.yellowAccent[900],
                            filled: true,
                            hintText: 'Tinggi Badan'),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (txt) {
                          setState(() {
                            berat = int.parse(txt);
                          });
                        },
                        keyboardType: TextInputType.number,
                        maxLength: 3,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        decoration: InputDecoration(
                            suffix: Text('kg'),
                            fillColor: Colors.orangeAccent[900],
                            filled: true,
                            hintText: 'Berat Badan'),
                      ),
                    ),
                  ],
                )),
            Container(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: username,
                    keyboardType: TextInputType.text,
                    maxLength: 35,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                        fillColor: Colors.yellowAccent[900],
                        filled: true,
                        hintText: 'Nama Pengguna'),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: TextField(
                    controller: gender,
                    keyboardType: TextInputType.text,
                    maxLength: 9,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                        fillColor: Colors.orangeAccent[900],
                        filled: true,
                        hintText: 'Jenis Kelamin'),
                  ),
                ),
              ],
            )),
            Container(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: dateborn,
                    keyboardType: TextInputType.text,
                    maxLength: 11,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                        fillColor: Colors.orangeAccent[900],
                        filled: true,
                        hintText: 'Tanggal Lahir'),
                  ),
                ),
              ],
            )),
            Container(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: agenumber,
                    keyboardType: TextInputType.text,
                    maxLength: 2,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 15,
                    ),
                    decoration: InputDecoration(
                        suffix: Text('Tahun'),
                        fillColor: Colors.orangeAccent[900],
                        filled: true,
                        hintText: 'Umur Pengguna'),
                  ),
                ),
              ],
            )),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => BMIResult(
                            tinggi_badan: tinggi,
                            berat_badan: berat,
                            nama_pengguna: username.text,
                            jenis_kelamin: gender.text,
                            tanggal_lahir: dateborn.text,
                            umur: agenumber.text)),
                  );
                },
                padding: EdgeInsets.only(top: 10, bottom: 10),
                color: Colors.greenAccent,
                textColor: Colors.black,
                child: Text(
                  'HITUNG BMI',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 45,
          color: Colors.lightBlue[100],
          alignment: Alignment.center,
          child: Text(
            '© Created By Marcel Prastiko Arthana',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ),
        //elevation: 0,
      ),
    );
  }
}

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0.0),
              image: DecorationImage(
                image: AssetImage(
                    '././images/Navigation.jpg'),
                fit: BoxFit.cover,
              ),
              color: Colors.deepPurpleAccent[400],
            ),
          ),
          ListTile(
            leading: Icon(Icons.adjust_outlined),
            title: Text('Online Identity'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => App()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.adjust_outlined),
            title: Text('Hitung BMI'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InputBMI()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.adjust_outlined),
            title: Text('Hitung Kubus'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HitungVolumeKubus()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle_rounded),
            title: Text('About'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => About()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
    );
  }
}
