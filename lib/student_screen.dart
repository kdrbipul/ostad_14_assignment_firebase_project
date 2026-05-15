import 'package:flutter/material.dart';
class StudentScreen extends StatelessWidget {
  final CollectionReference students =
  FirebaseFirestore.instance.collection('students');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List'),
      ),

      body: StreamBuilder<QuerySnapshot>(
        stream: students.snapshots(),
        builder: (context, snapshot) {

          if (snapshot.hasError) {
            return Center(
              child: Text('Something went wrong'),
            );
          }

          if (snapshot.connectionState ==
              ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final data = snapshot.data!.docs;

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {

              var student = data[index];

              return Card(
                margin: EdgeInsets.all(10),
                child: ListTile(
                  title: Text(student['name']),
                  subtitle: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Roll: ${student['rollNumber']}',
                      ),
                      Text(
                        'Course: ${student['course']}',
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}