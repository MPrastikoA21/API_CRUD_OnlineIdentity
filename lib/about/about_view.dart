import 'package:flutter/material.dart';
import '../color/colors.dart' as BaseColors;
import '../bmi.dart';
import '../HitungKubus.dart';
import '/src/app.dart';


class About extends StatefulWidget {
  @override
  AboutView createState() => new AboutView();
}
abstract class Aboutmodel extends State<About> {}

class AboutView extends  Aboutmodel{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          AboutViewAppBar(),
          SliverList(
              delegate: SliverChildListDelegate([
            Center(
              child: Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: BaseColors.blue.withOpacity(.2),
                          blurRadius: 10.0)
                    ],
                  ),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset(
                        'images/GambarProfile.jpg'),
                  )),
            ),
            SizedBox(height: 10.0),
            Center(
                child: Text('Developer',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black.withOpacity(.2),
                        fontWeight: FontWeight.bold))),
            Center(
                child: Text('Marcel Prastiko Arthana',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: BaseColors.darkbluesea,
                        fontWeight: FontWeight.bold))),
            Center(
                child: Text('1915051013',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: BaseColors.darkbluesea,
                        fontWeight: FontWeight.bold))),
            Center(
                child: Text('Bali, Indonesia',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: BaseColors.darkbluesea,
                        fontWeight: FontWeight.bold))),
            Center(
                child: Text('Universitas Pendidikan Ganesha',
                    style: TextStyle(
                        fontSize: 18.0,
                        color: BaseColors.darkbluesea,
                        fontWeight: FontWeight.bold))),
            SizedBox(height: 30.0),
            Center(child: ProfileRating()),
            SizedBox(height: 20.0),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Log Activity',
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'OpenSans')),
                  SizedBox(height: 10.0),
                  Wrap(
                    children: List.generate(3, (_) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          leading: Container(
                            width: 50.0,
                            height: 50.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60.0),
                                gradient: LinearGradient(colors: [
                                  BaseColors.pictonblue,
                                  BaseColors.aliceblue
                                ])),
                          ),
                          title: Text('Online Text CRUD Data'),
                          subtitle: Text('An hour ago'),
                        ),
                      );
                    }),
                  )
                ],
              ),
            )
          ])),
        ],
      ),
    );
  }
}

class AboutViewAppBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      leading: Container(
        padding: EdgeInsets.all(10.0),
        child: FlatButton(
          onPressed: () {},
          child: Icon(Icons.dehaze_outlined, color: Colors.black),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: Icon(Icons.bookmark, color: BaseColors.yellowAccent),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {},
            child: Icon(Icons.add, color: BaseColors.purple),
          ),
        ),
        SizedBox(width: 10.0)
      ],
    );
  }
}

class ProfileRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      child: Flex(
        crossAxisAlignment: CrossAxisAlignment.center,
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StarRating(5,
              colors: [BaseColors.pictonblue, BaseColors.aliceblue]),
          SizedBox(width: 20.0),
          StarRating(1,
              colors: [BaseColors.purple, BaseColors.purpleWarm]),
          SizedBox(width: 20.0),
          StarRating(2,
              colors: [BaseColors.yellow, BaseColors.yellowWarm])
        ],
      ),
    );
  }
}

class StarRating extends StatelessWidget {
  final int star;
  final List<Color> colors;

  StarRating(this.star, {this.colors});

  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 5,
      height: 70.0,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(blurRadius: 5.0, color: Colors.black.withOpacity(.2))
          ],
          gradient: LinearGradient(
              colors: colors == null ? [Colors.black, Colors.white] : colors)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(star.toString() + '.0',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white.withOpacity(.7),
                  fontWeight: FontWeight.w700)),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                  star,
                  (index) => Icon(Icons.star,
                      size: 10.0, color: Colors.white.withOpacity(.7))),
            ),
          )
        ],
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
            title: Text('Flutter CRUD API'),
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

