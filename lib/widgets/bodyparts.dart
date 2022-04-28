import 'package:flutter/material.dart';
import 'package:app/helpers/weatherdata.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skeletons/skeletons.dart';
import 'package:app/constants/skeletonview.dart';
import 'homescreenstuffs.dart';
import 'package:app/helpers/getlocdata.dart';

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  Future fetchData() async {
    Position lok = await Lokation().determinePosition();
    return await getData(lok.latitude, lok.longitude);
  }

  @override
  void initState() {
    super.initState;
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchData(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Skeleton(
                isLoading: true, skeleton: const haddi(), child: Column());
          }
          if (!snapshot.hasData) {
            return const Text("not found");
            // return homescreenstuffs(snapshot);
          }
          return RefreshIndicator(
              onRefresh: () {
                fetchData();
                throw (FlutterError);
              },
              child: homescreenstuffs(snapshot));
        });
  }
}
