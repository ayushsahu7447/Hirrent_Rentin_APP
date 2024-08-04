import 'dart:developer';

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hirrent/auth/service/auth_controller.dart';
import 'package:hirrent/constant/utils.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

import '../../bottom_nav_bar.dart';
import '../../ewidget/button.dart';
import '../../ewidget/textformfield.dart';

class signin extends ConsumerStatefulWidget {
  const signin({Key? key}) : super(key: key);

  @override
  ConsumerState<signin> createState() => _signinState();
}

class _signinState extends ConsumerState<signin> {
  // final _otplessFlutterPlugin = Otpless();
  // final phoneController = TextEditingController();
  // Country? country;
  //
  // @override
  // void dispose() {
  //   super.dispose();
  //   phoneController.dispose();
  // }
  //
  // void pickCountry() {
  //   showCountryPicker(
  //       context: context,
  //       onSelect: (Country _country) {
  //         setState(() {
  //           country = _country;
  //         });
  //       });
  // }
  //
  // void sendPhoneNumber() {
  //   String phoneNumber = phoneController.text.trim();
  //   if (country != null && phoneNumber.isNotEmpty) {
  //     ref
  //         .read(authControllerProvider)
  //         .signInWithPhone(context, '+${country!.phoneCode}$phoneNumber');
  //   } else {
  //     showSnackBar(context, 'Fill out all the fields');
  //   }
  // }
  //
  // void initiateWhatsappLogin(String intentUrl) async {
  //   var result =
  //       await _otplessFlutterPlugin.loginUsingWhatsapp(intentUrl: intentUrl);
  //   switch (result['code']) {
  //     case "581":
  //       log(result['message'].toString());
  //       //TODO: handle whatsapp not found
  //       break;
  //     default:
  //   }
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   initPlatformState();
  // }

  // Future<void> initPlatformState() async {
  //   _otplessFlutterPlugin.authStream.listen((token) {
  //     // TODO: Handle user token like storing in SharedPreferences or navigation
  //     log(token.toString());
  //     if (token != null) {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (_) => bottomnavbar(),
  //         ),
  //       );
  //     }
  //   });
  // }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final mobNo = TextEditingController();
  bool isRememberMe = false;

  //onTap: () async {
  //   initiateWhatsappLogin(
  //     "https://otpless.authlink.me?redirectUri=otpless://dev",
  //   );
  // },
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: size.height,
            color: Color.fromRGBO(221, 213, 224, 100),
            child: Stack(
              children: [
                Container(
                    height: size.height / 3,
                    width: size.width,
                    child: Image.asset(
                      "assets/backdark.png",
                      fit: BoxFit.cover,
                    )),
                Column(
                  children: [
                    SizedBox(
                      height: size.height / 20,
                    ),
                    Center(
                        child: Image.asset(
                      "assets/logo.png",
                      height: size.height / 5,
                    )),
                    Container(
                      height: size.height / 1.7,
                      width: size.width / 1.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          children: [
                            SizedBox(
                              height: size.height / 90,
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: 20.0 , right: 20, bottom: 20),
                              child: MyTextField(
                                myController: mobNo,
                                fieldName: 'Enter Mobile No.',
                                myIcon: Icons.call_outlined,
                                prefixIconColor:
                                    Color.fromRGBO(113, 40, 201, 80),
                                keyboard: TextInputType.text,
                                maxlines: 1,
                                onSaved: (value) {},
                              ),
                            ),
                            submit(label: "Send Me OTP",width: size.width/12, onCountSelected:(){}),
                            Row(
                              children: [
                                Spacer(),
                                Theme(
                                    child: Checkbox(
                                        value: isRememberMe,
                                        activeColor: Colors.deepPurple,
                                        onChanged: (value) {
                                          setState(() {
                                            isRememberMe = !isRememberMe;
                                          });
                                        }),
                                    data: ThemeData(
                                      unselectedWidgetColor:
                                          Color.fromRGBO(113, 40, 201, 80),
                                    )),
                                Text("Get important updates on whatsapp",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.grey,
                                    )),
                                Spacer()
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: size.height / 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.deepPurpleAccent,
                                            Colors.deepPurple,
                                          ],
                                          begin:
                                              const FractionalOffset(0.0, 0.0),
                                          end: const FractionalOffset(1.0, 1.0),
                                          stops: [0.0, 1.0],
                                          tileMode: TileMode.clamp),
                                    ),
                                    width: size.width / 4,
                                    height: 1.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        left: 15.0, right: 15.0),
                                    child: Text(
                                      "Or",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepPurple,
                                          decoration: TextDecoration.none,
                                          fontSize: 15.0),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          colors: [
                                            Colors.deepPurple,
                                            Colors.deepPurpleAccent,
                                          ],
                                          begin:
                                              const FractionalOffset(0.0, 0.0),
                                          end: const FractionalOffset(1.0, 1.0),
                                          stops: [0.0, 1.0],
                                          tileMode: TileMode.clamp),
                                    ),
                                    width: size.width / 4,
                                    height: 1.0,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: () {},
                                style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(7.0))),
                                  side: BorderSide(width: 2.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 20.0, right: 20, bottom: 5, top: 5),
                                  child: Text(
                                    'Continue with Guest',
                                    style: TextStyle(
                                        color: Colors.deepPurple, fontSize: 15),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text("Login using",
                                  style: TextStyle(fontSize: 10)),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Center(
                                child: Image.asset("assets/whatsapp.png", height: size.height/10,),
                              ),
                            ),
                            SizedBox(height: 20,)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
