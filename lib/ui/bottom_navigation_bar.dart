import 'package:pet_care/ui/appoinments.dart';
import 'package:pet_care/ui/explore.dart';
import 'package:pet_care/ui/petdetails.dart';
import 'package:pet_care/ui/profile.dart';

import 'package:pet_care/ui/search_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../intl/appcolor.dart';

class Bottomnavigationbar extends StatefulWidget {
  Bottomnavigationbar({super.key, required this.islogin});
  bool islogin;

  @override
  State<Bottomnavigationbar> createState() => _BottomnavigationbarState();
}

class _BottomnavigationbarState extends State<Bottomnavigationbar> {
  double _sheetHeight = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (widget.islogin == true) {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _showBottomSheet(context); // Display the bottom sheet smoothly
        }); // Call the function to show the bottom sheet
      });
    }
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      shape: RoundedRectangleBorder(
        // Define the shape
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: 376,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 33.0, left: 18, right: 57),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child:
                            SvgPicture.asset("assets/images/close icon.svg")),
                    Spacer(),
                    const Text(
                      "Add pet detail",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.39,
                          color: AppColor.figmablacktext),
                    ),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 34, left: 42),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.figmapetcaretext,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          child: Text(
                            "Faster check-in at appointment.",
                            maxLines: 3,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.19,
                                color: AppColor.figmablacktext),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.figmapetcaretext,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Text(
                            "Schedule of vaccination, haircuts, inspections etc.",
                            softWrap: true,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.19,
                                color: AppColor.figmablacktext),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.figmapetcaretext,
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Expanded(
                          child: Text(
                            "Reminder of the upcoming events with your pet.",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.19,
                                color: AppColor.figmablacktext),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 30, right: 32),
                child: Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return PetDetails();
                        }));
                      },
                      child: Container(
                        // width: 150,
                        // height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: AppColor.figmavoilet,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 46.5, vertical: 7),
                          child: Center(
                            child: Text(
                              "+Add",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        // width: 150,
                        // height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: AppColor.lightgray2,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 46.5, vertical: 7),
                          child: Center(
                            child: Text(
                              "No,later",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: AppColor.figmablacktext,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  bool search = true;
  var appoinments = false;
  var explore = false;
  var profile = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 83,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              setState(() {
                                search = true;
                                appoinments = false;
                                explore = false;
                                profile = false;
                              });
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/find icon.svg",
                                      color: search
                                          ? AppColor.figmavoilet
                                          : AppColor.figmadevider),
                                  Text("Search",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 0.4,
                                          color: search
                                              ? AppColor.figmavoilet
                                              : AppColor.figmadevider)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              setState(() {
                                search = false;
                                appoinments = true;
                                explore = false;
                                profile = false;
                              });
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/icon clock.svg",
                                      color: appoinments
                                          ? AppColor.figmavoilet
                                          : AppColor.figmadevider),
                                  Text("Appoinments",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 0.4,
                                          color: appoinments
                                              ? AppColor.figmavoilet
                                              : AppColor.figmadevider)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              setState(() {
                                search = false;
                                appoinments = false;
                                explore = true;
                                profile = false;
                              });
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/icon explore.svg",
                                      color: explore
                                          ? AppColor.figmavoilet
                                          : AppColor.figmadevider),
                                  Text("Explore",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          fontStyle: FontStyle.normal,
                                          letterSpacing: 0.4,
                                          color: explore
                                              ? AppColor.figmavoilet
                                              : AppColor.figmadevider)),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              setState(() {
                                search = false;
                                appoinments = false;
                                explore = false;
                                profile = true;
                              });
                            },
                            child: Container(
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                      "assets/images/icon profile.svg",
                                      color: profile
                                          ? AppColor.figmavoilet
                                          : AppColor.figmadevider),
                                  Text(
                                    "Profile",
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.normal,
                                        letterSpacing: 0.4,
                                        color: profile
                                            ? AppColor.figmavoilet
                                            : AppColor.figmadevider),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: 132,
                      height: 5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColor.figmadevider,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: PageView(
        children: [
          if (search == true) SearchScreen(),
          if (appoinments == true) Appoinments(),
          if (explore == true) Explore(),
          if (profile == true) Profile(),
        ],
      ),
    );
  }
}
