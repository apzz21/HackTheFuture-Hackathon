import 'package:flutter/material.dart';
import 'package:htfnew/pages/chat_message.dart';
import 'package:htfnew/pages/gen_ai.dart';
import 'package:htfnew/pages/student_courses_page.dart'; // Import the message page
import 'package:htfnew/pages/chat_page.dart';
import 'package:htfnew/roadmap_gen.dart';

class StudentHomePagenew extends StatelessWidget {
  const StudentHomePagenew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 41, 10, 105)

      ),
      body: StudentProfile(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_road_sharp),
            label: 'RoadMap',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
        ],
        onTap: (index) {
          if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatApp(), // Navigating to ChatApp
              ),
            );
          }
          else  if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RoadmapApp()
                ), // Navigating to ChatApp
            );
          }
        },
      ),
    );
  }
}

class StudentProfile extends StatelessWidget {
  final List<String> enrolledCourses = [
    'Introduction to Data Science',
    'Advanced Flutter Development',
    'UI/UX Design Principles',
  ];

  final String userName = "User Name";
  final String userRole = "Learner";
  final String userEmail = "user@example.com";

  StudentProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Information Container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: IconButton(
                      iconSize: 90,
                      icon: const Icon(Icons.account_circle,color: Color.fromARGB(255, 41, 10, 105)),
                      
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        userRole,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        userEmail,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Chat Icons Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Better spacing
                    children: [
                      Column(
                        children: [
                          const Text('Chat'),
                          const SizedBox(height: 1),
                          IconButton(
                            icon: const Icon(Icons.message, color: Color.fromARGB(255, 41, 10, 105), size: 35),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ChatApp(), // Navigating to ChatApp
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('Chat pengAI'),
                          const SizedBox(height: 1),
                          IconButton(
                            icon: const Icon(Icons.message, color: Color.fromARGB(255, 41, 10, 105), size: 35),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChatPageG(), // Navigating to ChatApp (change if necessary)
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Enroll Course Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Enroll Course'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StudentCoursesPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Generate Course Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GenAi(),
                          ),
                        );
                      },
                      child: const Text('Generate Course'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Enrolled Courses Section
                  const Text(
                    'Enrolled Courses',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: enrolledCourses.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ListTile(
                          leading: const Icon(
                            Icons.book,
                            color: Color.fromARGB(255, 41, 10, 105),
                          ),
                          title: Text(enrolledCourses[index]),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const StudentCoursesPage(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
