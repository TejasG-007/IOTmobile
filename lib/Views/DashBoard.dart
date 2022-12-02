import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iotmobile/ControllerFiles/AuthController.dart';
import 'package:iotmobile/Model/CheckSlot.dart';
import 'package:iotmobile/Model/SlotData.dart';
import 'package:lottie/lottie.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../ControllerFiles/Dialog.dart';
import '../ControllerFiles/Helper.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final controller = Get.put(StateHelper());
  AuthController _firebaseAuth = AuthController.instance;

  FirebaseFirestore _storage = FirebaseFirestore.instance;

  double parkingPrice = 1.75;
  double bufferPrice = 2.75;
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                      Tooltip(
                          message: "Sign Out",
                          child: IconButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        backgroundColor: Colors.purpleAccent,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(40)),
                                        content: Text(
                                          "Signing out...",
                                          style: GoogleFonts.signika(
                                              color: Colors.white),
                                        )));
                                _firebaseAuth.SignOut();
                              },
                              icon: Icon(Icons.logout_outlined)))
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
                    boxShadow: const [
                      BoxShadow(
                          spreadRadius: .1,
                          blurRadius: 3,
                          color: Colors.grey,
                          offset: Offset(0.5, 0.9))
                    ]),
                child: ListView(
                  children: [
                    Text("Slot Booking Window",
                        style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                            fontSize: 20)),
                    const SizedBox(
                      height: 20,
                    ),
                    StreamBuilder(
                      stream: _firebaseAuth.storage
                          .collection("ParkingSlots")
                          .snapshots(),
                      builder: (context, snap) {
                        return snap.connectionState == ConnectionState.active ||
                                snap.hasData
                            ? Table(
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
                                    DateTime.fromMicrosecondsSinceEpoch(
                                                int.parse(CheckSlot.fromMap(snap
                                                        .data!.docs[0]
                                                        .data())
                                                    .bookedTime))
                                            .isBefore(DateTime.now())
                                        ? SlotHintViewer(true)
                                        : SlotHintViewer(false),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 35, left: 15),
                                      child:
                                          DateTime.fromMicrosecondsSinceEpoch(
                                                      int.parse(
                                                          CheckSlot.fromMap(snap
                                                                  .data!.docs[0]
                                                                  .data())
                                                              .bookedTime))
                                                  .isBefore(DateTime.now())
                                              ? Text(
                                                  "Available",
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.green),
                                                )
                                              : Text(
                                                  "Not-Available",
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.red),
                                                ),
                                    ),
                                    DateTime.fromMicrosecondsSinceEpoch(
                                                int.parse(CheckSlot.fromMap(snap
                                                        .data!.docs[0]
                                                        .data())
                                                    .bookedTime))
                                            .isBefore(DateTime.now())
                                        ? Container(
                                            margin:
                                                const EdgeInsets.only(top: 15),
                                            child: button(
                                                icon: Icon(
                                                  Icons.ads_click,
                                                  color: Colors.green,
                                                ),
                                                label: Text(
                                                  "Book Slot-1",
                                                  style: GoogleFonts.signika(),
                                                ),
                                                onClick: () {
                                                  BottomSheetContainer(
                                                      context, "Slot-1");
                                                }),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              dialog(
                                                  "It Will be Available After ${DateTime.fromMicrosecondsSinceEpoch(int.parse(CheckSlot.fromMap(snap.data!.docs[0].data()).bookedTime)).toString().substring(11, 16)}",
                                                  context,
                                                  Icon(
                                                    Icons.timelapse,
                                                    color: Colors.red,
                                                    size: 50,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                        "Okay.",
                                                        style: GoogleFonts
                                                            .signika(),
                                                      )));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 2,
                                                        offset: Offset(.5, .9))
                                                  ]),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.warning_amber,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("Slot-Full",
                                                      style: GoogleFonts.mulish(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w500))
                                                ],
                                              ),
                                            ),
                                          ),
                                  ]),
                                  TableRow(children: [
                                    DateTime.fromMicrosecondsSinceEpoch(
                                                int.parse(CheckSlot.fromMap(snap
                                                        .data!.docs[1]
                                                        .data())
                                                    .bookedTime))
                                            .isBefore(DateTime.now())
                                        ? SlotHintViewer(true)
                                        : SlotHintViewer(false),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 35, left: 15),
                                      child:
                                          DateTime.fromMicrosecondsSinceEpoch(
                                                      int.parse(
                                                          CheckSlot.fromMap(snap
                                                                  .data!.docs[1]
                                                                  .data())
                                                              .bookedTime))
                                                  .isBefore(DateTime.now())
                                              ? Text(
                                                  "Available",
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.green),
                                                )
                                              : Text(
                                                  "Not-Available",
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.red),
                                                ),
                                    ),
                                    DateTime.fromMicrosecondsSinceEpoch(
                                                int.parse(CheckSlot.fromMap(snap
                                                        .data!.docs[1]
                                                        .data())
                                                    .bookedTime))
                                            .isBefore(DateTime.now())
                                        ? Container(
                                            margin:
                                                const EdgeInsets.only(top: 15),
                                            child: button(
                                                icon: Icon(
                                                  Icons.ads_click,
                                                  color: Colors.green,
                                                ),
                                                label: Text(
                                                  "Book Slot-2",
                                                  style: GoogleFonts.signika(),
                                                ),
                                                onClick: () {
                                                  BottomSheetContainer(
                                                      context, "Slot-2");
                                                }),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              dialog(
                                                  "It Will be Available After ${DateTime.fromMicrosecondsSinceEpoch(int.parse(CheckSlot.fromMap(snap.data!.docs[1].data()).bookedTime)).toString().substring(11, 16)}",
                                                  context,
                                                  Icon(
                                                    Icons.timelapse,
                                                    color: Colors.red,
                                                    size: 50,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                        "Okay.",
                                                        style: GoogleFonts
                                                            .signika(),
                                                      )));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 2,
                                                        offset: Offset(.5, .9))
                                                  ]),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.warning_amber,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("Slot-Full",
                                                      style: GoogleFonts.mulish(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w500))
                                                ],
                                              ),
                                            ),
                                          ),
                                  ]),
                                  TableRow(children: [
                                    DateTime.fromMicrosecondsSinceEpoch(
                                                int.parse(CheckSlot.fromMap(snap
                                                        .data!.docs[2]
                                                        .data())
                                                    .bookedTime))
                                            .isBefore(DateTime.now())
                                        ? SlotHintViewer(true)
                                        : SlotHintViewer(false),
                                    Container(
                                      margin: const EdgeInsets.only(
                                          top: 35, left: 15),
                                      child:
                                          DateTime.fromMicrosecondsSinceEpoch(
                                                      int.parse(
                                                          CheckSlot.fromMap(snap
                                                                  .data!.docs[2]
                                                                  .data())
                                                              .bookedTime))
                                                  .isBefore(DateTime.now())
                                              ? Text(
                                                  "Available",
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.green),
                                                )
                                              : Text(
                                                  "Not-Available",
                                                  style: GoogleFonts.mulish(
                                                      color: Colors.red),
                                                ),
                                    ),
                                    DateTime.fromMicrosecondsSinceEpoch(
                                                int.parse(CheckSlot.fromMap(snap
                                                        .data!.docs[2]
                                                        .data())
                                                    .bookedTime))
                                            .isBefore(DateTime.now())
                                        ? Container(
                                            margin:
                                                const EdgeInsets.only(top: 15),
                                            child: button(
                                                icon: Icon(
                                                  Icons.ads_click,
                                                  color: Colors.green,
                                                ),
                                                label: Text(
                                                  "Book Slot-3",
                                                  style: GoogleFonts.signika(),
                                                ),
                                                onClick: () {
                                                  BottomSheetContainer(
                                                      context, "Slot-3");
                                                }),
                                          )
                                        : InkWell(
                                            onTap: () {
                                              dialog(
                                                  "It Will be Available After ${DateTime.fromMicrosecondsSinceEpoch(int.parse(CheckSlot.fromMap(snap.data!.docs[2].data()).bookedTime)).toString().substring(11, 16)}",
                                                  context,
                                                  Icon(
                                                    Icons.timelapse,
                                                    color: Colors.red,
                                                    size: 50,
                                                  ),
                                                  ElevatedButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child: Text(
                                                        "Okay.",
                                                        style: GoogleFonts
                                                            .signika(),
                                                      )));
                                            },
                                            child: Container(
                                              alignment: Alignment.center,
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 20),
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(13),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 2,
                                                        offset: Offset(.5, .9))
                                                  ]),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.warning_amber,
                                                    color: Colors.red,
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text("Slot-Full",
                                                      style: GoogleFonts.mulish(
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.w500))
                                                ],
                                              ),
                                            ),
                                          ),
                                  ]),
                                ],
                              )
                            : const LinearProgressIndicator(
                                color: Colors.purpleAccent,
                              );
                      },
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
              StreamBuilder(
                stream: _firebaseAuth.storage
                    .collection("Users")
                    .doc(_firebaseAuth.auth.currentUser?.uid)
                    .collection("BookingHistory")
                    .snapshots(),
                builder: (context, snap) {
                  return snap.connectionState == ConnectionState.active ||
                          snap.hasData
                      ? Container(
                          height: MediaQuery.of(context).size.height / 2,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snap.data!.docs.length,
                              itemBuilder: (context, index) {
                                var data = snap.data!.docs[index].data();
                                SlotData realdata = SlotData.fromMap(data);
                                return ListTile(
                                  isThreeLine: true,
                                  leading: Icon(
                                    Icons.add_task_outlined,
                                    color: Colors.green,
                                  ),
                                  title: Text(
                                    "Booked Slot: ${realdata.slotNumber} Date:${DateTime.fromMicrosecondsSinceEpoch(int.parse(realdata.bookingTime)).toString().substring(0, 11)}"
                                        " ${DateTime.fromMicrosecondsSinceEpoch(int.parse(realdata.bookingTime)).toString().substring(11, 16)} Price: ${realdata.totalPrice} INR",
                                    style: GoogleFonts.signika(
                                        color: Colors.blueGrey),
                                  ),
                                  subtitle: Text(
                                    "Parking Time: ${DateTime.fromMicrosecondsSinceEpoch(int.parse(realdata.parkTime)).toString().substring(11, 16)}   Park-Duration: ${realdata.parkDuration} min.",
                                    style:
                                        GoogleFonts.mulish(color: Colors.grey),
                                  ),
                                );
                              }),
                        )
                      : Text("No Booking History Found",
                          style: TextStyle(color: Colors.grey));
                },
              )
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

  ElevatedButton button({onClick, label, icon}) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      )),
      onPressed: onClick,
      label: label,
      icon: icon,
    );
  }

  BottomSheetContainer(BuildContext context, String buttonLabel) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 80,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(""),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Select Buffer Timing",
                      style: GoogleFonts.signika(),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Tooltip(
                      textStyle: GoogleFonts.mulish(),
                      enableFeedback: true,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(.2, .1),
                                color: Colors.grey,
                                blurRadius: .9)
                          ]),
                      message:
                          "Buffer timing is Considered as time required before reaching Parking Area.",
                      child: const Icon(Icons.info_outline_rounded),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                button(
                    icon: const Icon(Icons.timelapse),
                    onClick: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text(
                                  "Select Buffer Timing.",
                                  style:
                                      GoogleFonts.signika(color: Colors.green),
                                ),
                                actions: [
                                  button(
                                      onClick: () {
                                        Get.back();
                                      },
                                      icon: Icon(Icons.done),
                                      label: Text(
                                        "Okay.",
                                        style: GoogleFonts.signika(
                                            color: Colors.green),
                                      ))
                                ],
                                content: SleekCircularSlider(
                                  onChange: (val) {
                                    final data = val.ceil().toInt().toString();
                                    controller.bufferTime.value = data;
                                    controller.bufferPrice.value =
                                        (int.parse(data) * bufferPrice)
                                            .toString();
                                  },
                                  appearance: CircularSliderAppearance(
                                      size: 200,
                                      infoProperties: InfoProperties(
                                        mainLabelStyle: GoogleFonts.signika(),
                                        modifier: (double value) {
                                          final roundedValue =
                                              value.ceil().toInt().toString();
                                          return '$roundedValue min/Rs.${(value.ceil().toInt()) * bufferPrice}';
                                        },
                                        topLabelText: "Minutes/Rupees",
                                        topLabelStyle: GoogleFonts.sahitya(),
                                      ),
                                      customWidths: CustomSliderWidths(
                                        progressBarWidth: 18,
                                      )),
                                  min: 0,
                                  max: 60,
                                  initialValue:
                                      double.parse(controller.bufferTime.value),
                                ),
                              ));
                    },
                    label: Text(
                      "Add Buffer time",
                      style: GoogleFonts.signika(color: Colors.green),
                    )),
                SizedBox(
                  height: 5,
                ),
                const Divider(
                  height: .5,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.purple,
                ),
                Expanded(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Text("Select Exact Park in time.",
                                style: GoogleFonts.saira(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: 5,
                            ),
                            button(
                                icon: const Icon(Icons.av_timer),
                                onClick: () async {
                                  final time = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                    initialEntryMode:
                                        TimePickerEntryMode.dialOnly,
                                    confirmText: "CONFIRM",
                                    cancelText: "NOT NOW",
                                    helpText: "PARKING/BOOKING TIME",
                                  );
                                  controller.earliarParkingTime.value =
                                      controller.parkingTime.value;
                                  controller.parkingTime.value =
                                      time?.hour != null
                                          ? "${time?.hour}:${time?.minute}"
                                          : controller.earliarParkingTime.value;
                                },
                                label: Text(
                                  "Park time",
                                  style:
                                      GoogleFonts.signika(color: Colors.green),
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                            Text("Select Parking Duration.",
                                style: GoogleFonts.saira(
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: 5,
                            ),
                            button(
                                icon: const Icon(Icons.av_timer),
                                onClick: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text(
                                              "Select Parking Duration.",
                                              style: GoogleFonts.signika(),
                                            ),
                                            actions: [
                                              button(
                                                  onClick: () {
                                                    Get.back();
                                                  },
                                                  icon: Icon(Icons.done),
                                                  label: Text(
                                                    "Okay.",
                                                    style: GoogleFonts.signika(
                                                        color: Colors.green),
                                                  ))
                                            ],
                                            content: SleekCircularSlider(
                                              onChange: (val) {
                                                final data = val
                                                    .ceil()
                                                    .toInt()
                                                    .toString();
                                                controller.parkingDuration
                                                    .value = data;
                                                controller.parkingPrice.value =
                                                    (int.parse(data) *
                                                            parkingPrice)
                                                        .toString();
                                              },
                                              appearance:
                                                  CircularSliderAppearance(
                                                      size: 200,
                                                      infoProperties:
                                                          InfoProperties(
                                                        mainLabelStyle:
                                                            GoogleFonts
                                                                .signika(),
                                                        modifier:
                                                            (double value) {
                                                          final roundedValue =
                                                              value
                                                                  .ceil()
                                                                  .toInt()
                                                                  .toString();
                                                          return '$roundedValue min/Rs.${(value.ceil().toInt()) * parkingPrice}';
                                                        },
                                                        topLabelText:
                                                            "Minutes/Rupees",
                                                        topLabelStyle:
                                                            GoogleFonts
                                                                .sahitya(),
                                                      ),
                                                      customWidths:
                                                          CustomSliderWidths(
                                                        progressBarWidth: 18,
                                                      )),
                                              min: 0,
                                              max: 60,
                                              initialValue: double.parse(
                                                  controller
                                                      .parkingDuration.value),
                                            ),
                                          ));
                                },
                                label: Text(
                                  "Parking Duration",
                                  style:
                                      GoogleFonts.signika(color: Colors.green),
                                )),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      width: .5,
                      color: Colors.purple,
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Bill Details",
                              style: GoogleFonts.saira(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Obx(
                              () => Table(
                                defaultColumnWidth: FixedColumnWidth(100),
                                textDirection: TextDirection.ltr,
                                children: [
                                  TableRow(children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Buffer Time',
                                              style: GoogleFonts.signika())
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${controller.bufferTime} min.',
                                              style: GoogleFonts.signika())
                                        ]),
                                  ]),
                                  TableRow(children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Buffer Price',
                                              style: GoogleFonts.signika())
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${controller.bufferPrice} INR',
                                              style: GoogleFonts.signika())
                                        ]),
                                  ]),
                                  TableRow(children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Parking Time',
                                              style: GoogleFonts.signika())
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '${controller.parkingTime} [24-hours].',
                                              style: GoogleFonts.signika())
                                        ]),
                                  ]),
                                  TableRow(children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Parking Duration',
                                              style: GoogleFonts.signika())
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              '${controller.parkingDuration} min.',
                                              style: GoogleFonts.signika())
                                        ]),
                                  ]),
                                  TableRow(children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Parking Price',
                                              style: GoogleFonts.signika())
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('${controller.parkingPrice} INR',
                                              style: GoogleFonts.signika())
                                        ]),
                                  ]),
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.red,
                              endIndent: 20,
                              indent: 30,
                              height: 23,
                            ),
                            Obx(
                              () => Table(
                                defaultColumnWidth: FixedColumnWidth(100),
                                textDirection: TextDirection.ltr,
                                children: [
                                  TableRow(children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Total',
                                              style: GoogleFonts.signika(
                                                  fontWeight: FontWeight.bold))
                                        ]),
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Rs. ${double.parse(controller.parkingPrice.value) + double.parse(controller.bufferPrice.value)}',
                                              style: GoogleFonts.signika(
                                                  fontWeight: FontWeight.bold))
                                        ]),
                                  ]),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Pay With UPI",
                              style: GoogleFonts.mulish(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            InkWell(
                              enableFeedback: true,
                              hoverColor: Colors.blue,
                              splashColor: Colors.grey,
                              onTap: () async {
                                final result = await _firebaseAuth.bookSlot(SlotData(
                                    parkTime: DateTime.now()
                                        .add(Duration(
                                            minutes: int.parse(controller
                                                .parkingDuration.value)))
                                        .microsecondsSinceEpoch
                                        .toString(),
                                    bookingTime: DateTime.now()
                                        .microsecondsSinceEpoch
                                        .toString(),
                                    totalPrice: (double.parse(
                                                controller.parkingPrice.value) +
                                            double.parse(
                                                controller.bufferPrice.value))
                                        .toString(),
                                    parkDuration: controller
                                        .parkingDuration.value
                                        .toString(),
                                    slotNumber: buttonLabel));
                                if (result) {
                                  dialog(
                                      "Slot Booked Successfully",
                                      context,
                                      Icon(Icons.done_outline,
                                          size: 50, color: Colors.green),
                                      ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            "Okay.",
                                            style: GoogleFonts.signika(),
                                          )));
                                } else {
                                  dialog(
                                      "Unable to Book.",
                                      context,
                                      Icon(Icons.cancel_presentation_outlined,
                                          size: 50, color: Colors.green),
                                      ElevatedButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: Text(
                                            "Okay.",
                                            style: GoogleFonts.signika(),
                                          )));
                                }
                              },
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.blue,
                                          offset: Offset(.3, .3))
                                    ]),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/upi.png',
                                      scale: 10,
                                    ),
                                    SizedBox(
                                      width: 3,
                                    ),
                                    Text(
                                      "SUBMIT & PAY",
                                      style: GoogleFonts.signika(
                                          color: Colors.purpleAccent),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ))
              ],
            ),
          );
        });
  }
}
