import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iotmobile/ControllerFiles/Helper.dart';
import 'package:iotmobile/main.dart';

class LoginScreen extends StatelessWidget{

  final controller = Get.put(StateHelper());

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(child: Text("Parked In",style:GoogleFonts.mulish(
                  color: Colors.purpleAccent,fontWeight:FontWeight.bold,fontSize: 34
              )),),
              SizedBox(height: 50,),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset("assets/seatingoncar.jpg"),
              ),
              SizedBox(height: 30,),
              Container(child: Text("Get In",style:GoogleFonts.mulish(
                  color: Colors.purpleAccent,fontWeight:FontWeight.bold,fontSize: 24
              )),),
              Divider(height: 4,indent: 100,endIndent: 100,),
              SizedBox(height: 35,),
              Form(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      child: TextFormField(
                        style: GoogleFonts.mulish(),
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.purpleAccent,
                        cursorHeight: .2,
                        cursorRadius: Radius.circular(10),
                        decoration: InputDecoration(
                            labelText: "Mobile",
                            labelStyle: GoogleFonts.mulish(color: Colors.purpleAccent),
                            prefixText: "+91",
                            prefixStyle: GoogleFonts.mulish(),
                            hintText: "9100 99 2948",
                            disabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.purpleAccent
                                )
                            ) ,
                            enabledBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.purpleAccent
                                )
                            ) ,
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.purpleAccent
                                )
                            ) ,
                            focusColor: Colors.purpleAccent,

                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.purpleAccent
                                )
                            )
                        ),
                      ),),
                    SizedBox(height: 25,),
                    Obx(()=>Container(
                        margin: EdgeInsets.symmetric(horizontal: 30),
                        child: TextFormField(
                          obscureText: controller.isPasswordHidden.value,
                          style: GoogleFonts.mulish(),
                          autofocus: true,
                          keyboardType: TextInputType.visiblePassword,
                          cursorColor: Colors.purpleAccent,
                          cursorHeight: .2,
                          cursorRadius: Radius.circular(10),
                          decoration: InputDecoration(
                            labelText: "Password",
                              labelStyle: GoogleFonts.mulish(color: Colors.purpleAccent),
                              suffix: GestureDetector(
                                onTap: (){
                                  controller.ShowPassword();
                                },
                                child: controller.isPasswordHidden.value?Icon(Icons.visibility_rounded,color: Colors.purpleAccent,):Icon(Icons.visibility_off_rounded,color: Colors.purpleAccent,),
                              ),
                              suffixIconColor: Colors.purpleAccent,
                              prefixStyle: GoogleFonts.mulish(),
                              hintText: "Password",
                              disabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Colors.purpleAccent
                                  )
                              ) ,
                              enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Colors.purpleAccent
                                  )
                              ) ,
                              focusedBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Colors.purpleAccent
                                  )
                              ) ,
                              focusColor: Colors.purpleAccent,

                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                      color: Colors.purpleAccent
                                  )
                              )
                          ),
                        ),),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50,),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child:ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: Container(
                        color: Colors.purpleAccent,
                        child: IconButton(
                          onPressed: (){
                            Get.to(DashBoardScreen());
                          },
                          icon: Icon(Icons.arrow_forward_rounded,color: Colors.white,),
                        ),
                      )
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}