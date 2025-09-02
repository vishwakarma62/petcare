import 'package:pet_care/ui/bottom_navigation_bar.dart';
import 'package:pet_care/ui/register_with_email.dart';
import 'package:pet_care/services/auth_service.dart';
import 'package:pet_care/services/api_exception.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../intl/appcolor.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  var nameCTR = TextEditingController();
  var emailCTR = TextEditingController();
  var passwordCTR = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;
  final AuthService _authService = AuthService();
  toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _form = GlobalKey<FormState>();
  bool _isEmailValid = false;

  void _updateEmailValidity(String email) {
    setState(() {
      _isEmailValid = _isEmailFormatValid(email);
    });
  }

  bool _isEmailFormatValid(String email) {
    return RegExp(r'\S+@\S+\.\S+').hasMatch(email);
  }

  FocusNode myFocusNode = new FocusNode();

  Future<void> _handleLogin() async {
    if (!_form.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final response = await _authService.login(
        username: emailCTR.text.trim(),
        password: passwordCTR.text.trim(),
      );

      Fluttertoast.showToast(msg: 'Login successful!');
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Bottomnavigationbar(islogin: true);
      }));
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      setState(() => _isLoading = false);
    }
  }

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
              Stack(
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 338,
                      child: SvgPicture.asset(
                        "assets/images/Loader (2).svg",
                        fit: BoxFit.cover,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 49),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 12.0,
                            left: 20,
                          ),
                          child: Row(
                            children: [
                              InkWell(
                                  splashFactory: NoSplash.splashFactory,
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                      "assets/images/arrow left.svg")),
                              Spacer(),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 60.0, bottom: 24),
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w700,
                                    fontStyle: FontStyle.normal,
                                    color: Colors.white),
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            // height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: Form(
                                key: _form,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 24.0, left: 20, right: 20),
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        inputFormatters: [
                                          FilteringTextInputFormatter.deny(RegExp(
                                              r'\s')), // Deny whitespace (spaces)
                                        ],
                                        validator: (value) {
                                          // Check if this field is empty
                                          if (value == null || value.isEmpty) {
                                            return 'Enter email';
                                          }

                                          // using regular expression
                                          if (!RegExp(r'\S+@\S+\.\S+')
                                              .hasMatch(value)) {
                                            return "Please enter a valid email address";
                                          }

                                          // the email is valid
                                          return null;
                                        },
                                        controller: emailCTR,
                                        onChanged: _updateEmailValidity,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            suffixIcon: SizedBox(
                                                width: 10,
                                                height: 10,
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: _isEmailValid
                                                      ? SvgPicture.asset(
                                                          "assets/images/success.svg",
                                                          fit: BoxFit.cover,
                                                        )
                                                      : null,
                                                )),
                                            labelText: "Email",
                                            labelStyle: TextStyle(
                                                color: myFocusNode.hasFocus
                                                    ? Colors.blue
                                                    : Colors.black)),
                                      ),
                                      SizedBox(
                                        height: 16,
                                      ),
                                      TextFormField(
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(8),
                                          FilteringTextInputFormatter.deny(RegExp(
                                              r'\s')), // Deny whitespace (spaces)
                                        ],
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Enter password";
                                          } else {
                                            return null;
                                          }
                                        },
                                        controller: passwordCTR,
                                        obscureText: _obscureText,
                                        decoration: InputDecoration(
                                            suffixIcon: SizedBox(
                                              height: 10,
                                              width: 10,
                                              child: InkWell(
                                                  onTap: toggleObscureText,
                                                  child: _obscureText
                                                      ? Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Image.asset(
                                                            "assets/images/view.png",
                                                            fit: BoxFit.cover,
                                                            color: AppColor
                                                                .figmagray,
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Image.asset(
                                                            "assets/images/hidden.png",
                                                            fit: BoxFit.cover,
                                                            color: AppColor
                                                                .figmagray,
                                                          ),
                                                        )),
                                            ),
                                            labelText: "Password",
                                            labelStyle: TextStyle(
                                                color: myFocusNode.hasFocus
                                                    ? Colors.blue
                                                    : Colors.black)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: 12.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Spacer(),
                                            Text(
                                              "Don not remember the password?",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.figmavoilet,
                                                  letterSpacing: 0.29,
                                                  fontStyle: FontStyle.normal),
                                            )
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
                                          onPressed: _isLoading ? null : _handleLogin,
                                          child: _isLoading
                                              ? CircularProgressIndicator(color: Colors.white)
                                              : Text(
                                                  "Sign In",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w700,
                                                      fontStyle: FontStyle.normal,
                                                      color: Colors.white),
                                                ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                AppColor.figmabutton,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 61,
                        ),
                        Text("or continue with ",
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.normal,
                                letterSpacing: 0.19)),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset(
                                    "assets/images/Rectangle.svg",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 12.0,
                                      left: 15.29,
                                      right: 15,
                                      bottom: 12.91),
                                  child: SvgPicture.asset(
                                      "assets/images/noun_Facebook_2060938.svg"),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 55,
                            ),
                            SvgPicture.asset("assets/images/googletwo.svg"),
                          ],
                        ),
                        SizedBox(
                          height: 104,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have account yet?",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 0.19,
                                  fontStyle: FontStyle.normal),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RegisterWithEmail();
                                }));
                              },
                              child: Text("Registration",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.normal,
                                      color: AppColor.figmavoilet)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
