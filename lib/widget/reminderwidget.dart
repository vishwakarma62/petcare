import 'package:pet_care/model/reminder_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../intl/appcolor.dart';

class ReminderWidget extends StatefulWidget {
   ReminderWidget({super.key,required this.vaccine});
  Reminder vaccine;

  @override
  State<ReminderWidget> createState() => _ReminderWidgetState();
}

class _ReminderWidgetState extends State<ReminderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
//height: 144,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            "${widget.vaccine.Img}",
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
            "${widget.vaccine.vaccinename}",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColor.figmablacktext,
                fontStyle: FontStyle.normal),
          ),
          Text("${widget.vaccine.date}",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColor.lightgray,
                  fontStyle: FontStyle.normal)),
        ],
      ),
    );
  }
}
