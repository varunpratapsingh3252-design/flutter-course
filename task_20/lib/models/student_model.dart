class Student {
  int? id;
  String studentName;
  String rollNumber;
  String email;
  String mobile;
  String department;
  String semester;
  double cgpa;

  Student({
    this.id,
    required this.studentName,
    required this.rollNumber,
    required this.email,
    required this.mobile,
    required this.department,
    required this.semester,
    required this.cgpa,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'studentName': studentName,
      'rollNumber': rollNumber,
      'email': email,
      'mobile': mobile,
      'department': department,
      'semester': semester,
      'cgpa': cgpa,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      id: map['id'],
      studentName: map['studentName'],
      rollNumber: map['rollNumber'],
      email: map['email'],
      mobile: map['mobile'],
      department: map['department'],
      semester: map['semester'],
      cgpa: map['cgpa'],
    );
  }
}