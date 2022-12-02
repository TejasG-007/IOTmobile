import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iotmobile/ControllerFiles/AuthController.dart';
import 'package:iotmobile/ControllerFiles/Dialog.dart';
import 'package:iotmobile/ControllerFiles/Helper.dart';
import 'package:iotmobile/ControllerFiles/Validators.dart';
import 'package:iotmobile/Model/UserModel.dart';


class CreateAccount extends StatefulWidget {
  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final controller = Get.put(StateHelper());


  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _firstName = TextEditingController();
  TextEditingController _lastName = TextEditingController();

  AuthController  fireabaseauth = AuthController.instance;

  final  _createPasswordFormkey = GlobalKey<FormState>();

  @override
  void dispose() {
    _password.dispose();
    _email.dispose();
    _firstName.dispose();
    _lastName.dispose();
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
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset("assets/createAccount.png"),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Text("Sign Up",
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
                key: _createPasswordFormkey,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        style: GoogleFonts.mulish(),
                        controller: _firstName,
                        validator: requiredValidator,
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.purpleAccent,
                        cursorHeight: .2,
                        cursorRadius: Radius.circular(10),
                        decoration: InputDecoration(
                            labelText: "First Name",
                            labelStyle:
                                GoogleFonts.mulish(color: Colors.purpleAccent),
                            prefixStyle: GoogleFonts.mulish(),
                            hintText: "Enter First Name",
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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        style: GoogleFonts.mulish(),
                        controller: _lastName,
                        validator: requiredValidator,
                          
                        keyboardType: TextInputType.text,
                        cursorColor: Colors.purpleAccent,
                        cursorHeight: .2,
                        cursorRadius: Radius.circular(10),
                        decoration: InputDecoration(
                            labelText: "LastName",
                            labelStyle:
                                GoogleFonts.mulish(color: Colors.purpleAccent),
                            prefixStyle: GoogleFonts.mulish(),
                            hintText: "Enter Last Name",
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
                          validator: requiredValidator,
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
                                 if(_createPasswordFormkey.currentState!.validate()){
                                   FocusNode().unfocus();
                                   controller.makeButtonDisabled();
                                   final result = await fireabaseauth.createAccountwithEmailandPassword(_email.text, _password.text,UserDetails(FirstName: _firstName.text, LastName: _lastName.text, Email: _email.text));
                                   await Future.delayed(const Duration(seconds: 2));
                                   controller.makeButtonEnabled();
                                   if(result){
                                     dialog("Account Created Successfully.", context,Icon(Icons.done,size: 50,color: Colors.green,),ElevatedButton(onPressed: (){
                                       Get.back();
                                     }, child: Text("Okay.",style: GoogleFonts.signika(),)));
                                   }else{
                                     dialog("Unable to Sign Up.", context,Icon(Icons.warning_amber_outlined,size: 50,color: Colors.red,),ElevatedButton(onPressed: (){
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
