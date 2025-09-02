import 'package:pet_care/ui/mypet.dart';
import 'package:pet_care/ui/petdetails.dart';
import 'package:pet_care/ui/veterinarycard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../intl/appcolor.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              //height: 340,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.lightgray2,
                      offset: Offset(0, 20),
                      blurRadius: 20,
                    ),
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 53.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Container(
                            width: 58,
                            height: 24,
                          ),
                        ),
                        Spacer(),
                        Center(
                          child: Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.39,
                                color: AppColor.figmablacktext),
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/images/edit icon.svg"),
                              SizedBox(
                                width: 4,
                              ),
                              Text("Edit",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.normal,
                                      letterSpacing: 1.9,
                                      color: AppColor.figmavoilet)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 27,
                  ),
                  CircleAvatar(
                    backgroundImage: AssetImage(
                      "assets/images/Ellipse.jpg",
                    ),
                    radius: 56,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Maria Martinez",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.49,
                          color: AppColor.figmablacktext)),
                  Text("Kiev",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal,
                          letterSpacing: 0.19,
                          color: AppColor.Gray)),
                  SizedBox(
                    height: 33.5,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              margin: EdgeInsets.only(top: 45),
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return MyPet();
                        }));
                      },
                      child: Row(
                        children: [
                          Container(
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                color: AppColor.lightgray,
                                shape: BoxShape.circle),
                            child: SvgPicture.asset("assets/images/pet.svg"),
                          ),
                          SizedBox(
                            width: 15.89,
                          ),
                          Expanded(
                            child: Container(
                              // margin: EdgeInsets.only(top: 45),
                              // width: MediaQuery.of(context).size.width,
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColor.lightgray2,
                                      offset: Offset(0, 2),
                                      blurRadius: 1.5,
                                    )
                                  ]),
                              child: ListTile(
                                leading: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: Text(
                                    "My pet",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        letterSpacing: 0.19,
                                        color: AppColor.figmablacktext,
                                        fontStyle: FontStyle.normal),
                                  ),
                                ),
                                trailing: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: SvgPicture.asset(
                                      "assets/images/Arrow.svg"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              color: AppColor.lightgray,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                              "assets/images/heart favourite like.svg"),
                        ),
                        SizedBox(
                          width: 15.89,
                        ),
                        Expanded(
                          child: Container(
                            // width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: AppColor.lightgray2,
                                offset: Offset(0, 2),
                                blurRadius: 1.5,
                              )
                            ]),
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Text(
                                  "My favourutes",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.19,
                                      color: AppColor.figmablacktext,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child:
                                    SvgPicture.asset("assets/images/Arrow.svg"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              color: AppColor.lightgray,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                              "assets/images/help medic briefcase.svg"),
                        ),
                        SizedBox(
                          width: 15.89,
                        ),
                        Expanded(
                          child: Container(
                            // width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: AppColor.lightgray2,
                                offset: Offset(0, 2),
                                blurRadius: 1.5,
                              )
                            ]),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return PetDetails();
                                }));
                              },
                              leading: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Text(
                                  "Add pet service",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.19,
                                      color: AppColor.figmablacktext,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child:
                                    SvgPicture.asset("assets/images/Arrow.svg"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              color: AppColor.lightgray,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                              "assets/images/announcement.svg"),
                        ),
                        SizedBox(
                          width: 15.89,
                        ),
                        Expanded(
                          child: Container(
                            // width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: AppColor.lightgray2,
                                offset: Offset(0, 2),
                                blurRadius: 1.5,
                              )
                            ]),
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Text(
                                  "Invite friends ",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.19,
                                      color: AppColor.figmablacktext,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child:
                                    SvgPicture.asset("assets/images/Arrow.svg"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              color: AppColor.lightgray,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                              "assets/images/question mark circle.svg"),
                        ),
                        SizedBox(
                          width: 15.89,
                        ),
                        Expanded(
                          child: Container(
                            // width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: AppColor.lightgray2,
                                offset: Offset(0, 2),
                                blurRadius: 1.5,
                              )
                            ]),
                            child: ListTile(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return VeterinaryCards();
                                }));
                              },
                              leading: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Text(
                                  "Help",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.19,
                                      color: AppColor.figmablacktext,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child:
                                    SvgPicture.asset("assets/images/Arrow.svg"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Row(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                              color: AppColor.lightgray,
                              shape: BoxShape.circle),
                          child: SvgPicture.asset(
                              "assets/images/settings gear.svg"),
                        ),
                        SizedBox(
                          width: 15.89,
                        ),
                        Expanded(
                          child: Container(
                            // width: MediaQuery.of(context).size.width,
                            height: 40,
                            decoration:
                                BoxDecoration(color: Colors.white, boxShadow: [
                              BoxShadow(
                                color: AppColor.lightgray2,
                                offset: Offset(0, 1),
                                blurRadius: 1,
                              )
                            ]),
                            child: ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Text(
                                  "Settings",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.19,
                                      color: AppColor.figmablacktext,
                                      fontStyle: FontStyle.normal),
                                ),
                              ),
                              trailing: Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child:
                                    SvgPicture.asset("assets/images/Arrow.svg"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 35,
            ),
          ],
        ),
      ),
    );
  }
}
