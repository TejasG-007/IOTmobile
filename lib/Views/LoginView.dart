import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:iotmobile/ControllerFiles/Helper.dart';
import 'package:iotmobile/ControllerFiles/Validators.dart';

import '../ControllerFiles/AuthController.dart';
import '../ControllerFiles/Dialog.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final controller = Get.put(StateHelper());

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final _loginViewFormkey = GlobalKey<FormState>();

  AuthController fireabaseauth = AuthController.instance;

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Container(
                child: Text("EV CS Slot Booking",
                    style: GoogleFonts.mulish(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 34)),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset("assets/seatingoncar.jpg"),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text("Get In",
                    style: GoogleFonts.mulish(
                        color: Colors.purpleAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
              ),
              Divider(
                height: 4,
                indent: 100,
                endIndent: 100,
              ),
              SizedBox(
                height: 35,
              ),
              Form(
                key: _loginViewFormkey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        style: GoogleFonts.mulish(),
                        controller: _email,
                        validator: emailValidator,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.purpleAccent,
                        cursorHeight: .2,
                        cursorRadius: Radius.circular(10),
                        decoration: InputDecoration(
                            labelText: "Email",
                            labelStyle:
                                GoogleFonts.mulish(color: Colors.purpleAccent),
                            prefixStyle: GoogleFonts.mulish(),
                            hintText: "xyz@email.com",
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.purpleAccent)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.purpleAccent)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.purpleAccent)),
                            focusColor: Colors.purpleAccent,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: Colors.purpleAccent))),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Obx(
                      () => Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          validator: passwordValidator,
                          controller: _password,
                          obscureText: controller.isPasswordHidden.value,
                          style: GoogleFonts.mulish(),
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: Colors.purpleAccent,
                          cursorHeight: .2,
                          cursorRadius: Radius.circular(10),
                          decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: GoogleFonts.mulish(
                                  color: Colors.purpleAccent),
                              suffix: GestureDetector(
                                onTap: () {
                                  controller.ShowPassword();
                                },
                                child: controller.isPasswordHidden.value
                                    ? Icon(
                                        Icons.visibility_rounded,
                                        color: Colors.purpleAccent,
                                      )
                                    : Icon(
                                        Icons.visibility_off_rounded,
                                        color: Colors.purpleAccent,
                                      ),
                              ),
                              suffixIconColor: Colors.purpleAccent,
                              prefixStyle: GoogleFonts.mulish(),
                              hintText: "Password",
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.purpleAccent)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.purpleAccent)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.purpleAccent)),
                              focusColor: Colors.purpleAccent,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide:
                                      BorderSide(color: Colors.purpleAccent))),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    enableFeedback: true,
                    onTap: () {
                      Get.toNamed('/createAccount');
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Text("Create Account",
                          style: GoogleFonts.mulish(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.purpleAccent,
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  InkWell(
                    enableFeedback: true,
                    onTap: () {
                      Get.toNamed('/forgotPassword');
                    },
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: Text("Forgot Password?",
                          style: GoogleFonts.mulish(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.purpleAccent,
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Obx(
                () => controller.isButtonDisabled.value
                    ? Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: CircularProgressIndicator(
                              color: Colors.purple,
                            )))
                    : Container(
                        margin: EdgeInsets.symmetric(horizontal: 40),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(29),
                            child: Container(
                              color: Colors.purpleAccent,
                              child: IconButton(
                                onPressed: () async {
                                  if (_loginViewFormkey.currentState!
                                      .validate()) {
                                    FocusNode().unfocus();
                                    controller.makeButtonDisabled();
                                    final result = await fireabaseauth
                                        .signInwithEmailandPassword(
                                            _email.text, _password.text);
                                    await Future.delayed(
                                        const Duration(seconds: 2));
                                    controller.makeButtonEnabled();
                                    if (result) {
                                      Get.offNamed('/dashboard');
                                    } else {
                                      dialog(
                                          "Unable to Login.",
                                          context,
                                          Icon(
                                            Icons.warning_amber_outlined,
                                            size: 50,
                                            color: Colors.red,
                                          ),
                                          ElevatedButton(
                                              onPressed: () {
                                                Get.back();
                                              },
                                              child: Text(
                                                "Okay.",
                                                style: GoogleFonts.signika(),
                                              )));
                                    }
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ))),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
