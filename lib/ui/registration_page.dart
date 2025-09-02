import 'package:pet_care/intl/appcolor.dart';
import 'package:pet_care/ui/register_with_email.dart';
import 'package:pet_care/ui/sign_in.dart';
import 'package:pet_care/ui/welcome_screen_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SvgPicture.asset(
                "assets/images/Loader (2).svg",
                fit: BoxFit.fill,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 28,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 128.0, left: 40, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.normal),
                      ),
                      Row(
                        children: [
                          Text(
                            "to",
                            style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal),
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text("Pet Care",
                              style: TextStyle(
                                fontSize: 44,
                                color: AppColor.figmapetcaretext,
                                fontWeight: FontWeight.w700,
                                fontStyle: FontStyle.normal,
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 54,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, left: 40, bottom: 9.85),
                              child:
                                  SvgPicture.asset("assets/images/fb_icon.svg"),
                            ),
                            SizedBox(
                              width: 18.52,
                            ),
                            Text(
                              "Continue with ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.figmavoilet,
                                  letterSpacing: 0.16),
                            ),
                            Text(
                              "Facebook",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.figmavoilet,
                                  letterSpacing: 0.16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12.0, left: 40, bottom: 9.85),
                              child:
                                  SvgPicture.asset("assets/images/google.svg"),
                            ),
                            SizedBox(
                              width: 18.52,
                            ),
                            Text(
                              "Continue with ",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.figmavoilet,
                                  letterSpacing: 0.16),
                            ),
                            Text(
                              "Google",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.figmavoilet,
                                  letterSpacing: 0.16),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 61,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return RegisterWithEmail();
                          }));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.transparent,
                            border: Border.all(color: Colors.white, width: 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Register with Email",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    letterSpacing: 0.16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account?",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  letterSpacing: 0.16)),
                          SizedBox(
                            width: 4,
                          ),
                          InkWell(
                            highlightColor: Colors.transparent,
                            splashFactory: NoSplash.splashFactory,
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignIn();
                              }));
                            },
                            child: Text("Sign In",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    letterSpacing: 0.16)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
