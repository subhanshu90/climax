import 'package:flutter/material.dart';
import 'package:app/constants/textstyles.dart';
import 'package:google_fonts/google_fonts.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Search', style: GoogleFonts.poppins(textStyle: text3)),
          ],
        ),
        const TextField(
          obscureText: false,
          decoration: InputDecoration(
              border: OutlineInputBorder(), labelText: 'Search for City'),
        )
      ],
    );
  }
}
