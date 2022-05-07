import 'package:app/helpers/hourlyweather.dart';
import 'package:app/widgets/bodyparts.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../helpers/getlocdata.dart';
import '../helpers/weatherdata.dart';
import '../widgets/avatar.dart';
import 'package:app/widgets/graph.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: avatar(),
        ),
        body(),
        graph(),
      ],
    );
  }
}
