import 'package:flutter/material.dart';
import 'package:smartfit/shared/constants.dart';

class Background extends StatelessWidget {
  final Widget child;
  Background({required this.child});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: size.width * 0.3,
              height: size.width * 0.3,
              decoration: BoxDecoration(
                color: kGrey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(size.width * 0.6 / 2),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width * 0.3,
              height: size.width * 0.3,
              decoration: BoxDecoration(
                color: kGrey,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(size.width * 0.6 / 2),
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
