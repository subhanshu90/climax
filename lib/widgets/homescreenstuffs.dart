import 'package:flutter/material.dart';
import 'package:app/constants/textstyles.dart';
import 'package:app/widgets/kard.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class weatherCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  const weatherCard({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
    ]);
  }
}
