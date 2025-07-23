import 'package:covid_app/Screens/world_screen.dart';
import 'package:covid_app/api/WorldStatesApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

import '../models/countries.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  final cList = [Colors.blue, Colors.green, Colors.red];
  late final AnimationController _controller = AnimationController(
    duration: Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WorldStatesClass statesClass = WorldStatesClass();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: statesClass.fitchWorldStatesApi(),
                  builder: (context, AsyncSnapshot<WorldStatesApi> snapshot) {
                    if (snapshot.hasData) {

                      return
                        Column(
                          children: [
                            PieChart(
                              dataMap: {
                                "totals": double.parse(
                                  snapshot.data!.cases.toString(),
                                ),
                                "Deaths": double.parse(
                                  snapshot.data!.deaths.toString(),
                                ),
                                "Recovered": double.parse(
                                  snapshot.data!.recovered.toString(),
                                ),
                              },
                              chartRadius: MediaQuery.of(context).size.width * 0.25,
                              animationDuration: Duration(milliseconds: 1000),
                              chartType: ChartType.ring,
                              ringStrokeWidth: 15,
                              chartLegendSpacing: 80,
                              colorList: cList,
                              legendOptions: LegendOptions(
                                legendPosition: LegendPosition.left,
                              ),
                              chartValuesOptions: ChartValuesOptions(
                                showChartValuesInPercentage: true,
                              ),
                            ),
                            SizedBox(height: 20),
                            Card(
                              child: Column(
                                children: [
                                  ReuseAble(
                                    name: "Totals",
                                    value: snapshot.data!.cases.toString(),
                                  ),
                                  ReuseAble(
                                    name: "Deaths",
                                    value: snapshot.data!.deaths.toString(),
                                  ),
                                  ReuseAble(
                                    name: "Recovered",
                                    value: snapshot.data!.recovered.toString(),
                                  ),
                                  ReuseAble(
                                    name: "active",
                                    value: snapshot.data!.active.toString(),
                                  ),
                                  ReuseAble(
                                    name: "TodayDeaths",
                                    value: snapshot.data!.todayDeaths.toString(),
                                  ),
                                  ReuseAble(
                                    name: "TodayRecovered",
                                    value: snapshot.data!.todayRecovered.toString(),
                                  ),
                                  ReuseAble(
                                    name: "Critical",
                                    value: snapshot.data!.critical.toString(),
                                  ),

                                  ReuseAble(
                                    name: "CasesPerOneMillion",
                                    value: snapshot.data!.casesPerOneMillion.toString(),
                                  ),


                                ],
                              ),
                            ),

                            GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WorldScreen(),)),
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    right: 10.0,
                                    left: 10.0,
                                    top: 10,
                                    bottom: 20,

                                  ),
                                  child: Container(
                                    height: 35,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.green,
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Track Countries",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );

                    } else {
                      return

                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                             children: [
                               SpinKitFadingCircle(


                                 color: Colors.white,
                                 controller: _controller,
                                 size: 30,

                               ),
                             ],
                           );

                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReuseAble extends StatelessWidget {
  String name, value;

  ReuseAble({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(name), Text(value)],
          ),
        ],
      ),
    );
  }
}
