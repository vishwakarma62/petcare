import 'package:pet_care/ui/bottom_navigation_bar.dart';
import 'package:pet_care/ui/search_user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../intl/appcolor.dart';

class YourProfile extends StatefulWidget {
  const YourProfile({super.key});

  @override
  State<YourProfile> createState() => _YourProfileState();
}

class _YourProfileState extends State<YourProfile> {
  String? selectedvalue;
  void customradio(String? value) {
    setState(() {
      selectedvalue = value;
    });
  }

  var phoneCTR = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 49,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 14.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 32,
                          height: 32,
                          child: SvgPicture.asset(
                            "assets/images/arrow left.svg",
                            fit: BoxFit.cover,
                            color: AppColor.figmavoilet,
                          )),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Your profile",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.39,
                        color: AppColor.figmablacktext,
                        fontStyle: FontStyle.normal),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      // width: 58,

                      child: Text("Skip",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.19,
                              color: AppColor.figmavoilet,
                              fontStyle: FontStyle.normal)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 43,
              ),
              Row(
                children: [
                  Spacer(),
                  Container(
                    width: 118,
                    height: 118,
                    child: Stack(
                      children: [
                        CircleAvatar(
                          radius: 56,
                          backgroundImage:
                              AssetImage("assets/images/Ellipse.jpg"),
                        ),
                        Positioned(
                          left: 80.5,
                          bottom: 91.03,
                          right: 6.45,
                          child: Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                color: AppColor.figmavoilet,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                "assets/images/plus add.svg",
                                fit: BoxFit.cover,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          labelText: "Full name",
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Owner",
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                                onTap: () {
                                  customradio("male");
                                },
                                child: Container(
                                  height: 32,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: selectedvalue == "male"
                                            ? Colors.transparent
                                            : AppColor.lightgray),
                                    borderRadius: BorderRadius.circular(50),
                                    color: selectedvalue == "male"
                                        ? AppColor.figmavoilet
                                        : Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/male icon.svg",
                                          color: selectedvalue == "male"
                                              ? Colors.white
                                              : Colors.pink),
                                      Text(
                                        "Male",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: selectedvalue == "male"
                                                ? Colors.white
                                                : AppColor.figmablacktext,
                                            letterSpacing: 0.19),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashFactory: NoSplash.splashFactory,
                                onTap: () {
                                  customradio("female");
                                },
                                child: Container(
                                  height: 32,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: selectedvalue == "female"
                                            ? Colors.transparent
                                            : AppColor.lightgray),
                                    borderRadius: BorderRadius.circular(50),
                                    color: selectedvalue == "female"
                                        ? AppColor.figmavoilet
                                        : Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                          "assets/images/female icon.svg",
                                          color: selectedvalue == "female"
                                              ? Colors.white
                                              : Colors.pink),
                                      Text(
                                        "Female",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontStyle: FontStyle.normal,
                                            color: selectedvalue == "female"
                                                ? Colors.white
                                                : AppColor.figmablacktext,
                                            letterSpacing: 0.19),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    IntlPhoneField(
                      controller: phoneCTR,
                      showDropdownIcon: false,
                      dropdownTextStyle: TextStyle(color: Colors.grey),
                      showCountryFlag: false,
                      disableLengthCheck: true,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          suffixIcon: InkWell(
                            highlightColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              phoneCTR.clear();
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 29.0, right: 10, bottom: 12),
                              child:
                                  SvgPicture.asset("assets/images/delete.svg"),
                            ),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          labelText: "Phone",
                          labelStyle: TextStyle(color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey))),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      "About me",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.19,
                          color: Colors.grey,
                          fontStyle: FontStyle.normal),
                    ),
                    Container(
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: AppColor.lightgray2,
                        border: Border.all(color: AppColor.Gray),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: TextField(
                        maxLines: 5,
                        decoration: InputDecoration.collapsed(
                            hintText: 'Enter text...'),
                      ),
                    ),
                    SizedBox(
                      height: 17,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Bottomnavigationbar(islogin: false,);
                          }));
                        },
                        child: Text(
                          "Get Startted",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                              color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.figmabutton,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
