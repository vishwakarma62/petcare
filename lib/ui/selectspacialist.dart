import 'package:pet_care/widget/selectspecialistwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../intl/appcolor.dart';
import '../model/selectspecialist.dart';

class Selectspecialist extends StatefulWidget {
  const Selectspecialist({super.key});

  @override
  State<Selectspecialist> createState() => _SelectspecialistState();
}

class _SelectspecialistState extends State<Selectspecialist> {
  bool specialist = true;
  bool clinic = false;
  List<SelectspecialistModel> specialistlist = [
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.1.png",
        id: "1",
        name: "Alekseenko Vasily",
        title: "Veterinary Dentist",
        Reviews: 4,
        years: "10",
        amount: "\$20",
        location: "1.5"),
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.1.png",
        id: "2",
        name: "Alekseenko Vasily",
        title: "Veterinary Dentist",
        Reviews: 1,
        years: "10",
        amount: "\$20",
        location: "1.5"),
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.1.png",
        id: "3",
        name: "Alekseenko Vasily",
        title: "Veterinary Dentist",
        Reviews: 3,
        years: "10",
        amount: "\$20",
        location: "1.5"),
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.1.png",
        id: "4",
        name: "Alekseenko Vasily",
        title: "Veterinary Dentist",
        Reviews: 2.5,
        years: "10",
        amount: "\$20",
        location: "1.5"),
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.1.png",
        id: "5",
        name: "Alekseenko Vasily",
        title: "Veterinary Dentist",
        Reviews: 1.5,
        years: "10",
        amount: "\$20",
        location: "1.5"),
    SelectspecialistModel(
        IMG: "assets/images/Rectangle 2.1.png",
        id: "6",
        name: "Alekseenko Vasily",
        title: "Veterinary Dentist",
        Reviews: 2,
        years: "10",
        amount: "\$20",
        location: "1.5"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      color: AppColor.lightgray,
                      blurRadius: 20),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(34),
                    bottomRight: Radius.circular(34)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 49,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 20),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/images/arrow left.svg",
                          width: 32,
                          height: 32,
                          color: AppColor.figmavoilet,
                        ),
                        Spacer(),
                        Container(
                          width: 200,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColor.lightgray),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      specialist = true;
                                      clinic = false;
                                    });
                                  },
                                  child: Container(
                                    //height: 46,
                                    decoration: BoxDecoration(
                                      color: specialist == true
                                          ? AppColor.figmavoilet
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Center(
                                        child: Text(
                                          "Specialist",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: specialist == true
                                                  ? Colors.white
                                                  : AppColor.figmablacktext,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.19),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      specialist = false;
                                      clinic = true;
                                    });
                                  },
                                  child: Container(
                                    //height: 46,
                                    decoration: BoxDecoration(
                                      color: clinic == true
                                          ? AppColor.figmavoilet
                                          : Colors.white,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Center(
                                      child: Text("Clinics",
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: clinic == true
                                                  ? Colors.white
                                                  : AppColor.figmablacktext,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.19)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/map pin.svg",
                              color: AppColor.figmavoilet,
                            ),
                            Text(
                              "Map",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.19,
                                  color: AppColor.figmavoilet,
                                  fontStyle: FontStyle.normal),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 38,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: AppColor.lightgray,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(top: 8, right: 8, bottom: 10),
                          hintText: "Veterinary near Bazhana, 8b street",
                          hintStyle: TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                top: 8.0, left: 8, bottom: 8),
                            child: SvgPicture.asset(
                              "assets/images/find icon.svg",
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      children: [
                        Container(
                          width: 91,
                          height: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.figmavoilet,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/calendar.svg"),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "9 Sep",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Container(
                          width: 91,
                          height: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.figmavoilet,
                          ),
                          child: Center(
                            child: Text(
                              "Dentist",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 91,
                          height: 28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: AppColor.lightgray,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/XMLID 499.svg",
                                color: AppColor.figmablacktext,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "Filter",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.figmablacktext,
                                    fontStyle: FontStyle.normal),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            if (specialist == true)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListView.separated(
                        padding: EdgeInsets.zero,
                        primary: false,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Selectspecialistwidget(
                              specialist: specialistlist[index]);
                        },
                        separatorBuilder: (context, index) {
                          return Container(
                            height: 8,
                          );
                        },
                        itemCount: specialistlist.length),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
