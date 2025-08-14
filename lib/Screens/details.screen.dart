
import 'package:covid_app/Screens/main_screen.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

final  String name,image;

 final int  totalCases,
      deathCases,
      recoveredCases,
      active,
      critical,
      test,
     oneCasePerPeople,
     deathsPerOneMillion,

      todayRecovered;

  DetailsScreen({
    super.key,
    required this.image,
    required this.name,
    required this.totalCases,
    required this.deathCases,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.test,
    required this.recoveredCases,
    required this.oneCasePerPeople,
    required this.deathsPerOneMillion,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        leading: IconButton(onPressed:(){
          Navigator.pop(context);
        },icon: Icon(Icons.arrow_back_ios_outlined,size: 18,),highlightColor: Colors.deepPurpleAccent,),
        backgroundColor: Colors.blue,
        title: Center(
        child: Text(


          name,style: TextStyle(color: Colors.white,fontSize: 20),),
      ),),

      body: SafeArea(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [

              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Card(
                  child: Column(
                    children: [
                      ReuseAble(name: "Total", value: name),
                      ReuseAble(name: "DeathCases", value: deathCases.toString()),
                      ReuseAble(name: "RecoveredCases", value: recoveredCases.toString()),
                      ReuseAble(name: "Test", value: test.toString()),
                      ReuseAble(name: "Critical", value: critical.toString()),
                      ReuseAble(name: "Active", value: active.toString()),
                      ReuseAble(name: "TodayRecovered", value: todayRecovered.toString()),
                      ReuseAble(name: "oneCasePerPeople", value: oneCasePerPeople.toString()),
                      ReuseAble(name: "deathsPerOneMillion", value: deathsPerOneMillion.toString()),

                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(image),

              ),
            ],
          )
        ],
      )),
    );
  }
}
