import 'package:flutter/material.dart';
import './about/about_view.dart';
import 'bmi.dart';
import '/src/app.dart';

class HitungVolumeKubus extends StatefulWidget {
  @override
  _HitungVolumeKubusState createState() => _HitungVolumeKubusState();
}

class _HitungVolumeKubusState extends State<HitungVolumeKubus> {
  int sisi1 = 0;
  int sisi2 = 0;
  int sisi3 = 0;
  int volume = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent[400],
        title: Text('Hitung Volume Kubus'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.greenAccent[700],
            ),
            onPressed: () {},
          ), // IconButton
        ], // <Widget>[]
      ), // AppBar
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Image.asset(
                  './images/cubevolume.png',width:350,height:350),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 20, right: 20, top: 0),
              child: Row(
                children: <Widget>[
                  Expanded(
                      child: TextField(
                    onChanged: (txt) {
                      setState(() {
                        sisi1 = int.parse(txt);
                      });
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      suffix: Text('Cm'),
                      filled: true,
                      hintText: 'Sisi 1',
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextField(
                    onChanged: (txt) {
                      setState(() {
                        sisi2 = int.parse(txt);
                      });
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      suffix: Text('Cm'),
                      filled: true,
                      hintText: 'Sisi 2',
                    ),
                  )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: TextField(
                    onChanged: (txt) {
                      setState(() {
                        sisi3 = int.parse(txt);
                      });
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                    decoration: InputDecoration(
                      suffix: Text('Cm'),
                      filled: true,
                      hintText: 'Sisi 3',
                    ),
                  )),
                ],
              ),
            ),
            Container(
              // padding: EdgeInsets.only(left: 50, top: 5),
              margin: EdgeInsets.only(top: 15, bottom: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: Colors.black,
                ),
              ),

              child: RaisedButton(
                padding:
                    EdgeInsets.only(left: 50, top: 10, bottom: 10, right: 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                color: Colors.blueAccent,
                onPressed: () {
                  setState(() {
                    volume = sisi1 * sisi2 * sisi3;
                  });
                },
                child: Text("Hitung Volume Kubus",
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w500)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              child: Column(
                children: <Widget>[
                  Text('Answer',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.greenAccent[700],
                        fontWeight: FontWeight.bold,
                      )),
                  Text('$volume',
                      style: TextStyle(
                        fontSize: 60,
                      ))
                ],
              ),
            )
          ],
        ),
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
