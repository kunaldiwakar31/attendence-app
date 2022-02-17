import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  final String userType;

  DatabaseService({required this.uid, required this.userType});

  FirebaseFirestore userReference = FirebaseFirestore.instance;

  Future updateUserData(
      String name, String email, String rollno, String userType) async {
    DocumentReference documentReference = userType == 'Student'
        ? userReference.collection('Student').doc(uid)
        : userReference.collection('Teacher').doc(uid);

    Map<String, dynamic> data = {'uid': uid, 'userType': userType};

    await userReference.collection('User').add(data);

    return await documentReference.set({
      'name': name,
      'email': email,
      'userType': userType,
      'rollno': rollno,
      'Subjects': []
    });
  }

  Future<String> generateCode(
      String subject, String semester, String uid) async {
    var documentSnapshot =
        await userReference.collection('Teachers').doc(uid).get();
    List subjects = documentSnapshot.data()!['Subjects'];
    bool exists = false;
    String s = subject + ':' + semester;
    for (String sub in subjects) {
      var split = sub.split(':');
      String checker = split[0] + ':' + split[1];
      if (checker == s) {
        exists = true;
      }
    }
    if (exists) return 'Class Already Exists';

    String name = documentSnapshot.data()!['name'];
    Map<String, dynamic> data = {
      'subject': subject,
      'semester': semester,
      'teacher': name
    };

    var documentReference = await userReference.collection('Classes').add(data);
    subjects.add(subject + ':' + semester + ':' + documentReference.id);
    Map<String, dynamic> subjectData = {
      'Subjects': subjects,
      'name': documentSnapshot.data()!['name'],
      'email': documentSnapshot.data()!['email'],
      'rollno': '',
      'userType': 'Teacher'
    };

    await userReference.collection('Teachers').doc(uid).set(subjectData);
    return documentReference.id;
  }
}
