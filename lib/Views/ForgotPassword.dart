import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iotmobile/ControllerFiles/Dialog.dart';
import 'package:iotmobile/ControllerFiles/Helper.dart';
import 'package:iotmobile/ControllerFiles/Validators.dart';
import '../ControllerFiles/AuthController.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final controller = Get.put(StateHelper());

  TextEditingController _email = TextEditingController();

  final  _forgotViewFormkey = GlobalKey<FormState>();
  AuthController  fireabaseauth = AuthController.instance;
  @override
  void dispose() {
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
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset("assets/forgotPassword.jpg"),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text("Forgot Password",
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
                key: _forgotViewFormkey,
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
                  ],
                ),
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
                                  if(_forgotViewFormkey.currentState!.validate()){
                                    FocusNode().unfocus();
                                    controller.makeButtonDisabled();
                                    final result = await fireabaseauth.forgotPassword(_email.text);
                                    await Future.delayed(const Duration(seconds: 2));
                                    controller.makeButtonEnabled();
                                    if(result){
                                      dialog("Reset Password link has been sent on Register Mail.", context,Icon(Icons.done,size: 50,color: Colors.green,),ElevatedButton(onPressed: (){
                                        Get.toNamed('/login');
                                      }, child: Text("Home.",style: GoogleFonts.signika(),)));
                                    }else{
                                      dialog("Unable to Reset Password.", context,Icon(Icons.warning_amber_outlined,size: 50,color: Colors.red,),ElevatedButton(onPressed: (){
                                        Get.back();
                                      }, child: Text("Okay.",style: GoogleFonts.signika(),)));
                                    }
                                  }
                                },
                                icon: Icon(
                                  Icons.arrow_forward_rounded,
                                  color: Colors.white,
                                ),
                              ),
                            ))),
              ), SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
