import 'package:app/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class KardStuff extends StatefulWidget {
  const KardStuff({Key? key}) : super(key: key);

  @override
  State<KardStuff> createState() => _KardStuffState();
}

class _KardStuffState extends State<KardStuff> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(
              width: 20,
            ),
            const Icon(
              Icons.cloud_outlined,
              color: Colors.black,
              size: 20,
            ),
            const SizedBox(
              width: 20,
            ),
            Text('Weather',
                style: GoogleFonts.poppins(
                    textStyle: text2.copyWith(color: Colors.black))),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            '69°C',
            style: GoogleFonts.poppins(textStyle: text3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('Partialy cloudy',
              style: GoogleFonts.poppins(
                  textStyle: text1.copyWith(color: Colors.black))),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Card(
              elevation: 5,
              color: Colors.deepPurple[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Humidity',
                      style: GoogleFonts.poppins(
                          textStyle: text1.copyWith(color: Colors.black)),
                    ),
                    Text(
                      '69%',
                      style: GoogleFonts.poppins(textStyle: text2),
                    )
                  ],
                ),
              ),
            ),
            Card(
              elevation: 5,
              color: Colors.deepPurple[300],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Text(
                      'Humidity',
                      style: GoogleFonts.poppins(
                          textStyle: text1.copyWith(color: Colors.black)),
                    ),
                    Text(
                      '69%',
                      style: GoogleFonts.poppins(textStyle: text2),
                    )
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
