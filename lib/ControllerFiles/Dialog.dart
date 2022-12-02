import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

dialog(String label,BuildContext context,Icon icon,ElevatedButton button){

  return showDialog(context: context, builder:(context)=> AlertDialog(
    icon: icon,
    title: Text(label,style: GoogleFonts.signika(color: Colors.purple),),
    actions: [
      button
    ],
  ));
}