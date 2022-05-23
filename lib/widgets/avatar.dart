import 'package:flutter/material.dart';
import 'package:app/constants/textstyles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cat_avatar_generator/cat_avatar_generator.dart';

class avatar extends StatelessWidget {
  const avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: MeowatarImage.fromString("subh"),
          radius: 25.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 5.0),
          child: Text(
            'Hi,',
            style: GoogleFonts.poppins(textStyle: text1),
          ),
        ),
        Text(
          "Subhanshu 👋",
          style: GoogleFonts.poppins(textStyle: text2),
        )
      ],
    );
  }
}
