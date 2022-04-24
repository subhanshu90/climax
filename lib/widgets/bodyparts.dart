import 'package:app/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/kard.dart';
import 'package:app/widgets/avatar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:app/helpers/weatherdata.dart';
import 'package:app/helpers/iconresolver.dart';

late CurrWeather bruh;

class body extends StatefulWidget {
  const body({Key? key}) : super(key: key);

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  fetchData() async {
    FutureBuilder(
        future: getData(72.2, 32.0),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return bruh = snapshot.data;
          } else {
            return const CircularProgressIndicator();
          }
        });
  }

  @override
  void initState() {
    super.initState;
    fetchData();
  }

  Widget build(BuildContext context) {
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
                        KardInKard(text: '${bruh.temp}°C'),
                        KardInKard2(
                            bachwa: Column(
                          children: [
                            const Text(
                              'Feels like',
                              style: text2,
                            ),
                            Text(
                              '${bruh.feels_like.toString()} °C',
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
                            iconResolver(bruh.icon),
                            height: 50,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(
                            bruh.desc,
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
                              bruh.sunrise,
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
                              bruh.sunset,
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
                              bruh.pressure.toString(),
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
                              '${bruh.humidity.toString()} %',
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
                              bruh.dewpoint.toString(),
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
                          '${bruh.windspeed.toString()} m/s',
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
  }
}
