class Student {
  String name;
  String rollno;
  String email;
  List<Map<String, String>> subjects;

  Student(
      {required this.name,
      required this.rollno,
      required this.email,
      required this.subjects});
}

class Teacher {
  String name;
  String email;

  Teacher({required this.name, required this.email});
}
