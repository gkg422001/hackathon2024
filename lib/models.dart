class Patient {
  final int patientID;
  final String FirstName;
  final String LastName;
  final String Email;
  final String MobileNum;
  final int Age;
  final String Gender;

  Patient(
      {required this.patientID,
      required this.FirstName,
      required this.LastName,
      required this.Email,
      required this.MobileNum,
      required this.Age,
      required this.Gender});

  factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        patientID: json['patientID'],
        FirstName: json['firstName'],
        LastName: json['lastName'],
        Email: json['email'],
        MobileNum: json['mobileNum'],
        Age: json['age'],
        Gender: json['gender'],
      );
}
