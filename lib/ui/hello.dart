import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../intl/appcolor.dart';

class Hello extends StatefulWidget {
  const Hello({super.key});

  @override
  State<Hello> createState() => _HelloState();
}

class _HelloState extends State<Hello> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
      width: 120,
      height: 144,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "assets/images/plus add.svg",
            color: AppColor.figmavoilet,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            "sgdgdfgdgf",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColor.figmablacktext,
                fontStyle: FontStyle.normal),
          ),
          Text("gfdsgfdfgddg",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.lightgray,
                  fontStyle: FontStyle.normal)),
        ],
      ),
    ),
    );
  }
}