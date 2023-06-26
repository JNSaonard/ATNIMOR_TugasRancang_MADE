import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
 
class UpdateRecord extends StatefulWidget {
  
  const UpdateRecord({Key? key, required this.studentKey}) : super(key: key);
 
  final String studentKey;
 
  @override
  State<UpdateRecord> createState() => _UpdateRecordState();
}
 
class _UpdateRecordState extends State<UpdateRecord> {
 
  final  userNameController = TextEditingController();
  final  userNIMController= TextEditingController();
  final  userMajorController =TextEditingController();
 
  late DatabaseReference dbRef;
 
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Students');
    getStudentData();
  }
 
  void getStudentData() async {
    DataSnapshot snapshot = await dbRef.child(widget.studentKey).get();
 
    Map student = snapshot.value as Map;
 
    userNameController.text = student['name'];
    userNIMController.text = student['age'];
    userMajorController.text = student['salary'];
 
  }
  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Updating record'),
      ),
      body:  Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Updating data in Firebase Realtime Database',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userNameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter Your Name',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userNIMController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'NIM',
                  hintText: 'Enter Your NIM',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                controller: userMajorController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Major',
                  hintText: 'Enter Your Major',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {
 
                  Map<String, String> students = {
                    'Name': userNameController.text,
                    'NIM': userNIMController.text,
                    'Major': userMajorController.text
                  };
 
                  dbRef.child(widget.studentKey).update(students)
                  .then((value) => {
                     Navigator.pop(context) 
                  });
 
                },
                child: const Text('Update Data'),
                color: Colors.blue,
                textColor: Colors.white,
                minWidth: 300,
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}