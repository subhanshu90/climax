import 'package:flutter/material.dart';
import 'package:app/helpers/weatherdata.dart';
import 'package:geolocator/geolocator.dart';
import 'package:skeletons/skeletons.dart';
import 'package:app/constants/skeletonview.dart';
import 'package:app/helpers/getlocdata.dart';
import 'package:app/constants/textstyles.dart';
import 'package:app/widgets/kard.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animations/animations.dart';
import 'package:tuple/tuple.dart';
import 'package:app/helpers/hourlyweather.dart';

late List bruh;

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  Future fetchData() async {
    if (noloc) {
      await getData(ip);
    } else {
      Position lok = await Lokation().determinePosition();
      String coord = "${lok.latitude},${lok.longitude}";
      await getData(coord);
    }
    return await getcurrweatherdata(data);
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
          if (snapshot.connectionState == ConnectionState.none) {
            return Container(
              child: Image.asset("images/nointernet.jpg"),
            );
          }
          if (!snapshot.hasData) {
            return Container(
              child: Image.asset("images/nointernet.jpg"),
            );
          }
          bruh = snapshot.data!.toList();
          return weatherCard(snapshot: snapshot);
        });
  }
}

class weatherCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const weatherCard({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      openElevation: 0,
      closedElevation: 0,
      closedColor: Theme.of(context).colorScheme.background,
      openColor: Theme.of(context).colorScheme.background,
      closedBuilder: (context, action) => kard1(
        height: 325,
        width: double.infinity,
        child: Stack(clipBehavior: Clip.antiAliasWithSaveLayer, children: [
          SvgPicture.asset(
            'images/svg/6.svg',
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    KardInKard(
                      text: '${snapshot.data!.temp}°C',
                      textstyle: text3,
                    ),
                    Column(
                      children: [
                        KardInKard2(
                          bachwa: Row(
                            children: [
                              const Icon(Icons.arrow_drop_up),
                              Text(
                                '${snapshot.data!.max}°C',
                                style: GoogleFonts.poppins(textStyle: text1),
                              )
                            ],
                          ),
                        ),
                        KardInKard2(
                          bachwa: Row(
                            children: [
                              const Icon(Icons.arrow_drop_down),
                              Text(
                                '${snapshot.data!.min}°C',
                                style: GoogleFonts.poppins(textStyle: text1),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    KardInKard2(
                        bachwa: Column(
                      children: [
                        Text(
                          'Feels like',
                          style: GoogleFonts.poppins(textStyle: text1),
                        ),
                        Text(
                          '${snapshot.data!.feels_like.toString()} °C',
                          style: GoogleFonts.poppins(textStyle: text1),
                        ),
                      ],
                    )),
                  ],
                ),
                KardInKard2(
                  bachwa: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'http:' + snapshot.data!.icon,
                        height: 60,
                      ),
                      const SizedBox(
                        width: 40,
                      ),
                      Expanded(
                        child: Text(
                          snapshot.data!.status,
                          style: GoogleFonts.poppins(textStyle: text1),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: KardInKard(
                    text: '${snapshot.data!.city}, ${snapshot.data!.region}',
                    textstyle: text1,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
      openBuilder: (context, action) => DetailPage(snapshot: snapshot),
    );
  }
}

class DetailPage extends StatefulWidget {
  final AsyncSnapshot snapshot;
  const DetailPage({Key? key, required this.snapshot}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: false,
              expandedHeight: 250,
              leading: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back),
              ),
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Weather e-Details'),
                background: Image.asset(
                  "images/sunrise.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return _detailsGrid(bruh[index], index);
                }, childCount: bruh.length),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 9,
                    maxCrossAxisExtent: 350,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 2.0))
          ],
        ));
  }
}

Card _detailsGrid(Tuple2 bruh, int index) {
  return Card(
    color: Colors.deepPurple[100 * (index % 9)],
    margin: const EdgeInsets.all(5),
    child: KardInKard2(
      bachwa: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            bruh.item1,
            style: text2,
          ),
          Text(bruh.item2)
        ],
      ),
    ),
  );
}
