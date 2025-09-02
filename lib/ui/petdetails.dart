import 'package:pet_care/model/reminder_model.dart';
import 'package:pet_care/ui/your_profile.dart';
import 'package:pet_care/widget/reminderwidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';

import '../intl/appcolor.dart';

class PetDetails extends StatefulWidget {
  const PetDetails({super.key});

  @override
  State<PetDetails> createState() => _PetDetailsState();
}

class _PetDetailsState extends State<PetDetails> {
  final DOB = TextEditingController();
  String? selectedGender;
  String? value;
  // void handleGenderChange(String? value) {
  //    setState(() {
  //     selectedGender = value;

  //   });
  // }

  void customRadioButton(String? value) {
    setState(() {
      selectedGender = value;
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed
    DOB.dispose();
    super.dispose();
  }

  bool isSwitched1 = false;
  bool isSwitched2 = false;
  bool isSwitched3 = false;
  bool isSwitched4 = false;
  bool isSwitched5 = false;
  bool isSwitched6 = false;
  bool isSwitched7 = false;
  bool isSwitched8 = false;

  List<Reminder> reminderlist = [
    Reminder(
        Img: "assets/images/vaccine_icon.svg",
        vaccinename: "Measles vaccine",
        date: "30.08.2018 г"),
    Reminder(
        Img: "assets/images/vaccine_icon.svg",
        vaccinename: "Rabb vaccine",
        date: "30.08.2018 г"),
    Reminder(
        Img: "assets/images/vaccine_icon.svg",
        vaccinename: "Measles vaccine",
        date: "30.08.2018 г"),
    Reminder(
        Img: "assets/images/vaccine_icon.svg",
        vaccinename: "Measles vaccine",
        date: "30.08.2018 г"),
    Reminder(
        Img: "assets/images/vaccine_icon.svg",
        vaccinename: "Measles vaccine",
        date: "30.08.2018 г"),
    Reminder(
        Img: "assets/images/vaccine_icon.svg",
        vaccinename: "Measles vaccine",
        date: "30.08.2018 г"),
    Reminder(
        Img: "assets/images/vaccine_icon.svg",
        vaccinename: "Measles vaccine",
        date: "30.08.2018 г"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 49,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 20),
              child: Row(
                children: [
                  InkWell(
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
                      ),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Add pet detail",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.39,
                        color: AppColor.figmablacktext,
                        fontStyle: FontStyle.normal),
                  ),
                  Spacer(),
                  Text(
                    "Save",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.19,
                        color: AppColor.figmavoilet,
                        fontStyle: FontStyle.normal),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
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
                            AssetImage("assets/images/Ellipse.png"),
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
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("General",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.39,
                          fontStyle: FontStyle.normal)),
                  Text(
                    "Information",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.39,
                        fontStyle: FontStyle.normal),
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 29.0, right: 10, bottom: 12),
                          child: SvgPicture.asset("assets/images/Arrow.svg"),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: "pet's name",
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 29.0, right: 10, bottom: 12),
                          child: SvgPicture.asset("assets/images/Arrow.svg"),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: "Species of your pet",
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 29.0, right: 10, bottom: 12),
                          child: SvgPicture.asset("assets/images/Arrow.svg"),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: "Breed",
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 29.0, right: 10, bottom: 12),
                          child: SvgPicture.asset("assets/images/Arrow.svg"),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: "Size (Optional)",
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.19,
                            color: Colors.grey,
                            fontStyle: FontStyle.normal),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        children: [
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              customRadioButton("male");
                            },
                            child: Container(
                              width: 150,
                              height: 32,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(50),
                                color: selectedGender == "male"
                                    ? AppColor.figmavoilet
                                    : Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  SvgPicture.asset(
                                    "assets/images/male icon.svg",
                                    color: selectedGender == "male"
                                        ? Colors.white
                                        : Colors.pink,
                                  ),
                                  Text(
                                    "Male",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: selectedGender == "male"
                                            ? Colors.white
                                            : AppColor.figmablacktext,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.19),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              customRadioButton("female");
                            },
                            child: Container(
                              width: 150,
                              height: 32,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(50),
                                color: selectedGender == "female"
                                    ? AppColor.figmavoilet
                                    : Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Spacer(),
                                  SvgPicture.asset(
                                    "assets/images/female icon.svg",
                                    color: selectedGender == "female"
                                        ? Colors.white
                                        : Colors.pink,
                                  ),
                                  Text(
                                    "Female",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: selectedGender == "female"
                                            ? Colors.white
                                            : AppColor.figmablacktext,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.19),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onTap: () async {
                      var date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100));
                      if (date != null) {
                        DOB.text = DateFormat('dd/mm/yyyy').format(date);
                      }
                    },
                    readOnly: true,
                    controller: DOB,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 29.0, right: 10, bottom: 12),
                          child: SvgPicture.asset("assets/images/Arrow.svg"),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: "Date of birth",
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text("Additional Information",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.39,
                          color: AppColor.figmablacktext,
                          fontStyle: FontStyle.normal)),
                  SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Text("Neutered",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.16,
                              color: AppColor.figmablacktext,
                              fontStyle: FontStyle.normal)),
                      Spacer(),
                      Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          value: isSwitched1,
                          onChanged: (value) {
                            setState(() {
                              isSwitched1 = value;
                            });
                          },
                          inactiveTrackColor: AppColor.lightgray,
                          activeTrackColor: AppColor.figmavoilet,
                          inactiveThumbColor: AppColor.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text("Vaccinated",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.16,
                              color: AppColor.figmablacktext,
                              fontStyle: FontStyle.normal)),
                      Spacer(),
                      Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          value: isSwitched2,
                          onChanged: (value) {
                            setState(() {
                              isSwitched2 = value;
                            });
                          },
                          activeTrackColor: AppColor.figmavoilet,
                          inactiveTrackColor: AppColor.lightgray,
                          inactiveThumbColor: AppColor.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text("Friendly with dogs",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.16,
                              color: AppColor.figmablacktext,
                              fontStyle: FontStyle.normal)),
                      Spacer(),
                      Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          value: isSwitched3,
                          onChanged: (value) {
                            setState(() {
                              isSwitched3 = value;
                            });
                          },
                          inactiveTrackColor: AppColor.lightgray,
                          activeTrackColor: AppColor.figmavoilet,
                          inactiveThumbColor: AppColor.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text("Friendly with cats",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.16,
                              color: AppColor.figmablacktext,
                              fontStyle: FontStyle.normal)),
                      Spacer(),
                      Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          value: isSwitched4,
                          onChanged: (value) {
                            setState(() {
                              isSwitched4 = value;
                            });
                          },
                          inactiveTrackColor: AppColor.lightgray,
                          activeTrackColor: AppColor.figmavoilet,
                          inactiveThumbColor: AppColor.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text("Friendly with kids <10 year",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.16,
                              color: AppColor.figmablacktext,
                              fontStyle: FontStyle.normal)),
                      Spacer(),
                      Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          value: isSwitched5,
                          onChanged: (value) {
                            setState(() {
                              isSwitched5 = value;
                            });
                          },
                          inactiveTrackColor: AppColor.lightgray,
                          activeTrackColor: AppColor.figmavoilet,
                          inactiveThumbColor: AppColor.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text("Friendly with kids <10 year",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.16,
                              color: AppColor.figmablacktext,
                              fontStyle: FontStyle.normal)),
                      Spacer(),
                      Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          value: isSwitched6,
                          onChanged: (value) {
                            setState(() {
                              isSwitched6 = value;
                            });
                          },
                          inactiveTrackColor: AppColor.lightgray,
                          activeTrackColor: AppColor.figmavoilet,
                          inactiveThumbColor: AppColor.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text("Microchipped",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.16,
                              color: AppColor.figmablacktext,
                              fontStyle: FontStyle.normal)),
                      Spacer(),
                      Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          value: isSwitched7,
                          onChanged: (value) {
                            setState(() {
                              isSwitched7 = value;
                            });
                          },
                          inactiveTrackColor: AppColor.lightgray,
                          activeTrackColor: AppColor.figmavoilet,
                          inactiveThumbColor: AppColor.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Text("Purebred",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.16,
                              color: AppColor.figmablacktext,
                              fontStyle: FontStyle.normal)),
                      Spacer(),
                      Transform.scale(
                        scale: 0.9,
                        child: Switch(
                          activeTrackColor: AppColor.figmavoilet,
                          value: isSwitched8,
                          onChanged: (value) {
                            setState(() {
                              isSwitched8 = value;
                            });
                          },
                          inactiveTrackColor: AppColor.lightgray,
                          
                          inactiveThumbColor: AppColor.white,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(
                              top: 29.0, right: 10, bottom: 12),
                          child: SvgPicture.asset("assets/images/Arrow.svg"),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        labelText: "Pet's nursery name (optional)",
                        labelStyle: TextStyle(color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey))),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Reminders",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.49,
                        color: AppColor.figmablacktext,
                        fontStyle: FontStyle.normal),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                      "Add vaccines, haircuts, pills, estrus, etc. and you will receive notifications for the next event.",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.19,
                          color: AppColor.figmablacktext,
                          fontStyle: FontStyle.normal)),
                  SizedBox(
                    height: 24,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          height: 144,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            color: AppColor.lightgray,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: AppColor.figmavoilet,
                                  shape: BoxShape.circle,
                                ),
                                child: SvgPicture.asset(
                                  "assets/images/plus add.svg",
                                  color: Colors.white,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              Text(
                                "Add event",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.figmablacktext,
                                    fontStyle: FontStyle.normal),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        SizedBox(
                          height: 144,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return ReminderWidget(
                                  vaccine: reminderlist[index]);
                            },
                            separatorBuilder: (context, index) {
                              return Container(
                                width: 16,
                              );
                            },
                            itemCount: reminderlist.length),
                        ),
                        
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    width: 295,
                    height: 46,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return YourProfile();
                        }));
                      },
                      child: Text(
                        "Save",
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
