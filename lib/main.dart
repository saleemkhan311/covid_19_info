import 'dart:convert';
import 'package:covid_19_info/Widgets/Card.dart';
import 'package:covid_19_info/mostAffectedPannel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'appBar.dart';
import 'globalPannel.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'COVID-19 Info',
        darkTheme: ThemeData(),
        theme: ThemeData(
          
          accentColor: Colors.red,
          primaryColor: Colors.red,
        ),
        home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map worldData;

  fetchWorldData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/all');

    if (response.statusCode == 200) {
      setState(() {
        worldData = json.decode(response.body);
      });
    } else {
      throw Exception("Internet Problem");
    }
  }

  var regionalData;

  fetchRegionalData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/countries');

    if (response.statusCode == 200) {
      setState(() {
        regionalData = json.decode(response.body);
      });
    } else {
      throw Exception("Internet Problem");
    }
  }

  @override
  void initState() {
    fetchWorldData();
    fetchRegionalData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: "COVID-19 Info",
          gradientBegin: Colors.red,
          gradientEnd: Colors.black,
          button: ActionChip(
            label: Text(
              "Update",
              style: TextStyle(
                fontFamily: 'Aveny',
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
            onPressed: () {
              setState(() {
                fetchWorldData();
                fetchRegionalData();
              });
            },
          ),
        ),
        body: worldData == null
            ? Center(
                child: Center(child: CircularProgressIndicator()),
              )
            :  Column(
              children: <Widget>[
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      "Worldwide",
                      style: TextStyle(
                          fontFamily: 'Aveny',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(3.0, 3.0),
                              blurRadius: 15.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            )
                          ]),
                    ),
                    SizedBox(
                      width: 45,
                    ),
                    MaterialButton(
                      color: Colors.black54,
                      onPressed: () {},
                      child: Text(
                        "Regional",
                        style: TextStyle(
                          fontFamily: 'Aveny',
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                )),
               GlobalPannel(
                  worldData: worldData,
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:15.0,vertical: 15.0),
                  child: Text(
                      "Most Affected Countries",
                      style: TextStyle(
                          fontFamily: 'Aveny',
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(3.0, 3.0),
                              blurRadius: 15.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            )
                          ]),
                    ),
                ),
                CustomCard(),
               MostAffectedPannel(regionalData: regionalData,)
              ],
            ));
  }
}
