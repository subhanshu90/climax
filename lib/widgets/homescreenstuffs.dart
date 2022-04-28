import 'package:flutter/material.dart';
import 'package:app/constants/textstyles.dart';
import 'package:app/widgets/kard.dart';
import 'package:app/widgets/avatar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

Widget homescreenstuffs(AsyncSnapshot<dynamic> snapshot) {
  return ListView(
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
                      Text(
                        snapshot.data!.status,
                        style: GoogleFonts.poppins(textStyle: text1),
                      ),
                    ],
                  ),
                ),
                KardInKard(
                  text: '${snapshot.data!.city}, ${snapshot.data!.region},',
                  textstyle: text1,
                ),
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
  );
}
