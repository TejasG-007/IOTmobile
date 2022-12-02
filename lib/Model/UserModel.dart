class UserDetails {
  late String FirstName;
  late String LastName;
  late String Email;

  UserDetails({
    required this.FirstName,
    required this.LastName,
    required this.Email,
  });

  UserDetails.fromMap(Map<String, dynamic> map) {
    FirstName = map["FirstName"];
    LastName = map["LastName"];
    Email = map["Email"];
  }

  Map<String, dynamic> toMap() {
    return {
      "FirstName": FirstName,
      "LastName": LastName,
      "Email": Email,
    };
  }
}
