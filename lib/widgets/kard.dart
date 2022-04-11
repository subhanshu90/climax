import 'package:flutter/material.dart';

class Kard extends StatelessWidget {
  final AssetImage image;
  final Widget child;
  const Kard({required this.image, required this.child, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: child,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          image: DecorationImage(image: image, fit: BoxFit.cover),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
    );
  }
}
