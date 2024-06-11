import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.redAccent,
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          centerTitle: true,
          title: Text(
            'Weather Forecast',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: BuildBody(),
      ),
    );
  }
}

Widget BuildBody() {
  return Padding(
    padding: EdgeInsets.all(8),
    child: Column(
      children: [
        SearchArea(),
        SizedBox(
          height: 10,
        ),
        MainText(),
        SizedBox(
          height: 40,
        ),
        MainTemperature(),
        SizedBox(
          height: 40,
        ),
        AdvancedTemperature(),
        SizedBox(
          height: 40,
        ),
        FooterText(),
        SizedBox(
          height: 40,
        ),
        FooterForecast(),
      ],
    ),
  );
}

class SearchArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
          labelText: 'Enter City Name',
          labelStyle: TextStyle(color: Colors.white),
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: Colors.white,
          )),
    );
  }
}

class MainText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Moldova, Balti, MDA',
          style: TextStyle(color: Colors.white, fontSize: 35),
        ),
        Text(
          'Monday, June 10, 2024',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ],
    );
  }
}

class MainTemperature extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.wb_sunny,
          color: Colors.white,
          size: 80,
        ),
        SizedBox(
          width: 25,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '14 °F',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w200),
            ),
            Text(
              'LIGHT SNOW',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w300),
            )
          ],
        )
      ],
    );
  }
}

class AdvancedTemperature extends StatelessWidget {
  final List<IconData> icons = [Icons.ac_unit, Icons.ac_unit, Icons.ac_unit];
  final List<String> values = ['5', '3', '20'];
  final List<String> units = ['km/hr', '%', '%'];
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children:
          List.generate(3, (index) => _buildAdvancedTemperatureColumn(index)),
    );
  }

  Column _buildAdvancedTemperatureColumn(int index) {
    return Column(
      children: [
        Icon(icons[index], color: Colors.white, size: 30),
        Text(
          values[index],
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        ),
        Text(
          units[index],
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w300,
          ),
        )
      ],
    );
  }
}

class FooterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '7-DAY WEATHER FORECAST',
        style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300),
      ),
    );
  }
}

class FooterForecast extends StatelessWidget {
  final List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  final List<String> degrees = ['6', '22', '15', '17', '27', '10', '9'];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 450,
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: days.length,
        itemExtent: 190,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey[300],
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      days[index],
                      style: TextStyle(color: Colors.black, fontSize: 23),
                    ),
                  ],
                ),
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${degrees[index]}°F ',
                    style: TextStyle(color: Colors.black, fontSize: 23),
                  ),
                  Icon(Icons.wb_sunny, color: Colors.black, size: 40)
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
