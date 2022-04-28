import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class kard1 extends StatelessWidget {
  Widget child;
  kard1({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          color: Theme.of(context).colorScheme.secondaryContainer,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: child,
        ),
      ),
    );
  }
}

class KardInKard extends StatelessWidget {
  final String text;
  final TextStyle textstyle;

  const KardInKard({Key? key, required this.text, required this.textstyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(27, 0, 0, 0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                  textStyle: textstyle.copyWith(
                      color: const Color.fromARGB(255, 233, 223, 223))),
            ),
          ],
        ),
      ),
    );
  }
}

class KardInKard2 extends StatelessWidget {
  Widget bachwa;

  KardInKard2({
    Key? key,
    required this.bachwa,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(27, 0, 0, 0),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: bachwa,
      ),
    );
  }
}
