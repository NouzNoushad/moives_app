import 'package:flutter/material.dart';

class MovieHeader extends SliverPersistentHeaderDelegate {
  final double scrollOffset;
  MovieHeader({required this.scrollOffset});

  late final bottom = scrollOffset < 64.00 ? scrollOffset : 64.00;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final backdrop =
        Colors.black.withOpacity((scrollOffset / 100).clamp(0, 0.8).toDouble());
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          width: MediaQuery.of(context).size.width,
          child: Container(
            color: backdrop,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).viewPadding.top,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Movies App',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.cast),
                      ),
                    ],
                  ),
                ]),
          ),
        ),
        AnimatedPositioned(
            bottom: bottom,
            left: 0,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 100),
            child: ClipRect(
              clipBehavior: Clip.hardEdge,
              clipper: RectCustomClipper(bottom: bottom),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text(
                            'Movies',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )),
                  Opacity(
                    opacity: 1,
                    child: TextButton(
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Text('Tv Shows',
                                style: TextStyle(color: Colors.white))
                          ],
                        )),
                  ),
                ],
              ),
            )),
      ],
    );
  }

  @override
  double get maxExtent => 164.8 - bottom;

  @override
  double get minExtent => 164.8 - bottom;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class RectCustomClipper extends CustomClipper<Rect> {
  final double bottom;
  RectCustomClipper({required this.bottom});

  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, bottom, size.width, size.height);

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) =>
      oldClipper != this;
}
