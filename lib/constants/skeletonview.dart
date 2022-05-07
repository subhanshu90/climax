import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class haddi extends StatelessWidget {
  const haddi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonItem(
        child: Column(
      children: [
        const SizedBox(height: 40),
        const SkeletonAvatar(
          style: SkeletonAvatarStyle(
            width: double.infinity,
            height: 250,
          ),
        ),
        const SizedBox(height: 12),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const [
                SkeletonAvatar(
                    style: SkeletonAvatarStyle(width: 20, height: 20)),
                SizedBox(width: 8),
                SkeletonAvatar(
                    style: SkeletonAvatarStyle(width: 20, height: 20)),
                SizedBox(width: 8),
                SkeletonAvatar(
                    style: SkeletonAvatarStyle(width: 20, height: 20)),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
