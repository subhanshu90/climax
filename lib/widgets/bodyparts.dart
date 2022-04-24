import 'package:app/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/kard.dart';
import 'package:app/widgets/avatar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/helpers/weatherdata.dart';
import 'package:app/helpers/iconresolver.dart';

late Future bruh;

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  fetchData() async {
    bruh = getData(72.2, 32.0);
  }

  @override
  void initState() {
    super.initState;
    fetchData();
  }

  Widget build(BuildContext context) {
    return FutureBuilder(
        future: bruh,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(5),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: avatar(),
                  ),
                  kard1(
                    child: Stack(children: [
                      SvgPicture.asset(
                        'images/svg/7.svg',
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
                                KardInKard(text: '${snapshot.data!.temp}°C'),
                                KardInKard2(
                                    bachwa: Column(
                                  children: [
                                    const Text(
                                      'Feels like',
                                      style: text2,
                                    ),
                                    Text(
                                      '${snapshot.data!.feels_like.toString()} °C',
                                      style: text2,
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            KardInKard2(
                              bachwa: Row(
                                children: [
                                  Image.asset(
                                    iconResolver(snapshot.data!.icon),
                                    height: 50,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    snapshot.data!.desc,
                                    style: text1,
                                  ),
                                ],
                              ),
                            ),
                            KardInKard(text: "Gaylayout,bengalodu")
                          ],
                        ),
                      ),
                    ]),
                  ),
                  kard1(
                      child: Stack(
                    children: [
                      SvgPicture.asset(
                        'images/svg/2.svg',
                        fit: BoxFit.cover,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              KardInKard2(
                                bachwa: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Sunrise',
                                      style: text1,
                                    ),
                                    Text(
                                      snapshot.data!.sunrise,
                                      style: text1,
                                    )
                                  ],
                                ),
                              ),
                              KardInKard2(
                                bachwa: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Sunset',
                                      style: text1,
                                    ),
                                    Text(
                                      snapshot.data!.sunset,
                                      style: text1,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              KardInKard2(
                                bachwa: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Pressure',
                                      style: text1,
                                    ),
                                    Text(
                                      snapshot.data!.pressure.toString(),
                                      style: text1,
                                    )
                                  ],
                                ),
                              ),
                              KardInKard2(
                                bachwa: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'humidity',
                                      style: text1,
                                    ),
                                    Text(
                                      '${snapshot.data!.humidity.toString()} %',
                                      style: text1,
                                    )
                                  ],
                                ),
                              ),
                              KardInKard2(
                                bachwa: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Text(
                                      'Dew Point',
                                      style: text1,
                                    ),
                                    Text(
                                      snapshot.data!.dewpoint.toString(),
                                      style: text1,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          KardInKard2(
                            bachwa: Column(
                              children: [
                                const Text(
                                  'Wind Speed',
                                  style: text1,
                                ),
                                Text(
                                  '${snapshot.data!.windspeed.toString()} m/s',
                                  style: text1,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            );
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
