import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
 
class InsertData extends StatefulWidget {
  const InsertData({Key? key}) : super(key: key);
 
  @override
  State<InsertData> createState() => _InsertDataState();
}
 
class _InsertDataState extends State<InsertData> {
  
  final  userNameController = TextEditingController();
  final  userNIMController= TextEditingController();
  final  userMajorController =TextEditingController();
 
  late DatabaseReference dbRef;
 
  @override
  void initState() {
    super.initState();
    dbRef = FirebaseDatabase.instance.ref().child('Students');
  }
 
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attending Student'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'Put your Name, NIM, and Major down below',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              
              //Name
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

              //NIM
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

              //Major
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
                    'name': userNameController.text,
                    'nim': userNIMController.text,
                    'major': userMajorController.text
                  };
 
                  dbRef.push().set(students);
 
                },
                child: const Text('Submit'),
                color: Colors.blue,
                textColor: Color.fromARGB(255, 0, 0, 0),
                minWidth: 300,
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}