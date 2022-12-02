class CheckSlot {
  late String bookedTime;
  late String slotNumber;

  CheckSlot({required this.slotNumber, required this.bookedTime});

  toMap() {
    return {
      "bookedTime": bookedTime,
      "slotNumber": slotNumber,
    };
  }

  CheckSlot.fromMap(Map<String, dynamic> map) {
    slotNumber = map["slotNumber"];
    bookedTime = map["bookedTime"];
  }
}
