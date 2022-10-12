import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iotmobile/ControllerFiles/Helper.dart';
import 'package:iotmobile/Views/LoginView.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: LoginScreen(),
    );
  }
}

class DashBoardScreen extends StatelessWidget {
  final c = Get.put(StateHelper());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.adjust_rounded,
                        color: Colors.blueGrey.shade200,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "DASHBOARD",
                        style: GoogleFonts.nunito(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.purpleAccent.shade200),
                      ),
                    ],
                  )),
              const Divider(
                endIndent: 100,
                indent: 100,
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 1,
                      child: Lottie.asset("assets/57463-parking-concept.json",
                          width: 200)),
                  Expanded(
                      flex: 1,
                      child: RichText(
                          text: TextSpan(
                              text: "Instruction:",
                              style: GoogleFonts.mulish(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              children: [
                            TextSpan(
                                text:
                                    " Please Click on Below Buttons to Book your Car Parking slot.",
                                style: GoogleFonts.mulish(
                                    fontWeight: FontWeight.normal))
                          ])))
                ],
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height * .4,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: .08,
                          blurRadius: 3,
                          color: Colors.grey.shade300,
                          offset: const Offset(0, 0))
                    ]),
                child: Column(
                  children: [
                    Text("Slot Booking Window",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 20)),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(
                      () => Table(
                        textDirection: TextDirection.ltr,
                        children: [
                          TableRow(
                            children: [
                              Center(
                                child: Text(
                                  "Current Status",
                                  style: GoogleFonts.mulish(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purpleAccent),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Slot-Availability",
                                  style: GoogleFonts.mulish(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purpleAccent),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Booking",
                                  style: GoogleFonts.mulish(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.purpleAccent),
                                ),
                              ),
                            ],
                          ),
                          TableRow(children: [
                            c.GetisBooked("Slot-1")
                                ? SlotHintViewer(false)
                                : SlotHintViewer(true),
                            Container(
                              margin: const EdgeInsets.only(top: 35, left: 15),
                              child: c.GetisAvailable("Slot-1")
                                  ? Text(
                                      "Available",
                                      style: GoogleFonts.mulish(
                                          color: Colors.green),
                                    )
                                  : Text(
                                      "Not-Available",
                                      style:
                                          GoogleFonts.mulish(color: Colors.red),
                                    ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: ElevatedButton(
                                child: const Text("Book Slot-1"),
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: c.GetisBooked("Slot-1")
                                              ? const Icon(
                                                  Icons.crisis_alert_sharp)
                                              : Lottie.asset(
                                                  "assets/41146-sar-parking.json",
                                                  width: 50),
                                          content: c.GetisBooked("Slot-1")
                                              ? Text(
                                                  "Cannot Book Slot as it's Already Filled.\nThank you",
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.pinkAccent),
                                                )
                                              : Text(
                                                  "Slot has been Booked Succesfully.",
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.pinkAccent),
                                                ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text("OK"))
                                          ],
                                        )),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            c.GetisBooked("Slot-2")
                                ? SlotHintViewer(false)
                                : SlotHintViewer(true),
                            Container(
                              margin: const EdgeInsets.only(top: 35, left: 15),
                              child: c.GetisAvailable("Slot-2")
                                  ? Text(
                                      "Available",
                                      style: GoogleFonts.mulish(
                                          color: Colors.green),
                                    )
                                  : Text(
                                      "Not-Available",
                                      style:
                                          GoogleFonts.mulish(color: Colors.red),
                                    ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: ElevatedButton(
                                child: const Text("Book Slot-2"),
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: c.GetisBooked("Slot-2")
                                              ? const Icon(
                                                  Icons.crisis_alert_sharp)
                                              : Lottie.asset(
                                                  "assets/41146-sar-parking.json",
                                                  width: 50),
                                          content: c.GetisBooked("Slot-2")
                                              ? Text(
                                                  "Cannot Book Slot as it's Already Filled.\nThank you",
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.pinkAccent),
                                                )
                                              : Text(
                                                  "Slot has been Booked Succesfully.",
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.pinkAccent),
                                                ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text("OK"))
                                          ],
                                        )),
                              ),
                            ),
                          ]),
                          TableRow(children: [
                            c.GetisBooked("Slot-3")
                                ? SlotHintViewer(false)
                                : SlotHintViewer(true),
                            Container(
                              margin: const EdgeInsets.only(top: 35, left: 15),
                              child: c.GetisAvailable("Slot-3")
                                  ? Text(
                                      "Available",
                                      style: GoogleFonts.mulish(
                                          color: Colors.green),
                                    )
                                  : Text(
                                      "Not-Available",
                                      style:
                                          GoogleFonts.mulish(color: Colors.red),
                                    ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 15),
                              child: ElevatedButton(
                                child: const Text("Book Slot-3"),
                                onPressed: () => showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                          title: c.GetisBooked("Slot-3")
                                              ? const Icon(
                                                  Icons.crisis_alert_sharp)
                                              : Lottie.asset(
                                                  "assets/41146-sar-parking.json",
                                                  width: 50),
                                          content: c.GetisBooked("Slot-3")
                                              ? Text(
                                                  "Cannot Book Slot as it's Already Filled.\nThank you",
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.pinkAccent),
                                                )
                                              : Text(
                                                  "Slot has been Booked Succesfully.",
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.pinkAccent),
                                                ),
                                          actions: [
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: const Text("OK"))
                                          ],
                                        )),
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.filter_center_focus,
                      color: Colors.pinkAccent,
                    ),
                    Text(
                      "Recent Booking",
                      style: GoogleFonts.mulish(
                          color: Colors.purpleAccent,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Center(child: Text("No Booking History Found",style:TextStyle(color: Colors.grey)))
            ],
          ),
        ),
      ),
    );
  }

  SlotHintViewer(slot_status) {
    return slot_status
        ? Container(
            margin: EdgeInsets.all(10),
            height: 50,
            width: 50,
            child: Image.asset("assets/slot-available.png"),
          )
        : Container(
            margin: EdgeInsets.all(10),
            height: 50,
            width: 50,
            child: Image.asset("assets/slot-not-available.png"),
          );
  }
}
