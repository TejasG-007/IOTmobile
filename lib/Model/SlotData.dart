class SlotData {
  late String parkTime;
  late String parkDuration;
  late String totalPrice;
  late String bookingTime;
  late String slotNumber;

  SlotData(
      {required this.parkTime,
      required this.bookingTime,
      required this.totalPrice,
      required this.parkDuration,
      required this.slotNumber});

  toMap() {
    return {
      "parkTime": parkTime,
      "slotNumber": slotNumber,
      "parkDuration": parkDuration,
      "bookingTime": bookingTime,
      "totalPrice": totalPrice,
    };
  }

  SlotData.fromMap(Map<String, dynamic> map) {
    parkTime = map["parkTime"];
    slotNumber = map["slotNumber"];
    parkDuration = map["parkDuration"];
    totalPrice = map["totalPrice"];
    bookingTime = map["bookingTime"];
  }
}
