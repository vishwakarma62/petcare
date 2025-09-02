import 'package:flutter/material.dart';

import '../intl/appcolor.dart';
import '../model/popularspecialist.dart';

class PopularSpecialist extends StatefulWidget {
   PopularSpecialist({super.key,required this.popular});
  Popular popular;

  @override
  State<PopularSpecialist> createState() => _PopularSpecialistState();
}

class _PopularSpecialistState extends State<PopularSpecialist> {
  @override
  Widget build(BuildContext context) {
    return Text("${widget.popular.tittle}",
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            fontStyle: FontStyle.normal,
            color: AppColor.figmablacktext,
            letterSpacing: 0.39));
  }
}
