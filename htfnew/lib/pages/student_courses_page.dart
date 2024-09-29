
/*import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import '../models/course_model.dart';

class StudentCoursesPage extends StatefulWidget {
  const StudentCoursesPage({super.key});

  @override
  _StudentCoursesPageState createState() => _StudentCoursesPageState();
}

class _StudentCoursesPageState extends State<StudentCoursesPage> {
  bool isCompleteTab = true;
  List<Course> completeCourses = [];
  List<Course> upcomingCourses = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    String jsonString = await rootBundle.loadString('data/Courses.json');
    List<dynamic> jsonResponse = json.decode(jsonString);

    // Split the courses into complete and upcoming
    completeCourses = jsonResponse
        .where((course) => course['showAddReviewButton'] == true)
        .map((course) => Course.fromJson(course))
        .toList();

    upcomingCourses = jsonResponse
        .where((course) => course['showAddReviewButton'] == false)
        .map((course) => Course.fromJson(course))
        .toList();

    setState(() {}); // Update the UI
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Courses'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 41, 10, 105),
      ),
      body: Column(
        children: [
          _buildTabs(),
          Expanded(
            child: ListView(
              children: isCompleteTab
                  ? _buildCourseList(completeCourses)
                  : _buildCourseList(upcomingCourses),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabButton('Complete', isCompleteTab, () {
            setState(() {
              isCompleteTab = true;
            });
          }),
          _buildTabButton('Upcoming', !isCompleteTab, () {
            setState(() {
              isCompleteTab = false;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, bool isActive, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: isActive ? Colors.white : Colors.black,
        backgroundColor: isActive
            ? const Color.fromARGB(255, 41, 10, 105)
            : Colors.grey[300],
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }

  List<Widget> _buildCourseList(List<Course> courses) {
    return courses.map((course) {
      return _buildCourseCard(
        courseName: course.courseName,
        courseDetail: course.courseDetail,
        rating: course.rating,
        imagePath: course.imagePath,
        showAddReviewButton: course.showAddReviewButton,
      );
    }).toList();
  }

  Widget _buildCourseCard({
    required String courseName,
    required String courseDetail,
    required int rating,
    required String imagePath,
    required bool showAddReviewButton,
  }) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 30,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(courseDetail),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4.0),
                      Text('$rating'),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.bookmark_border),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('View Details'),
                ),
                const SizedBox(height: 8.0),
                if (showAddReviewButton)
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add Review'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Courses',
        ),
      ],
      currentIndex: 2,
      selectedItemColor: const Color.fromARGB(255, 41, 10, 105),
      onTap: (index) {
        // Handle tab switch logic if needed
      },
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'package:htfnew/pages/chat_message.dart';
import 'package:htfnew/pages/course_details_page.dart'; // Ensure this page exists
import 'package:htfnew/pages/course_review_page.dart';
import 'package:htfnew/pages/student_home_page.dart';
import 'package:htfnew/roadmap_gen.dart'; // Ensure this page exists

class StudentCoursesPage extends StatefulWidget {
  const StudentCoursesPage({super.key});

  @override
  _StudentCoursesPageState createState() => _StudentCoursesPageState();
}

class _StudentCoursesPageState extends State<StudentCoursesPage> {
  bool isCompleteTab = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Courses'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 41, 10, 105),
      ),
      body: Column(
        children: [
          _buildTabs(),
          Expanded(
            child: ListView(
              children: isCompleteTab
                  ? _buildCompleteCourses()
                  : _buildUpcomingCourses(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTabs() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildTabButton('Complete', isCompleteTab, () {
            setState(() {
              isCompleteTab = true;
            });
          }),
          _buildTabButton('Upcoming', !isCompleteTab, () {
            setState(() {
              isCompleteTab = false;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildTabButton(String title, bool isActive, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: isActive ? Colors.white : Colors.black,
        backgroundColor:
            isActive ? const Color.fromARGB(255, 41, 10, 105) : Colors.grey[300],
      ),
      onPressed: onPressed,
      child: Text(title),
    );
  }

  List<Widget> _buildCompleteCourses() {
    return [
      _buildCourseCard(
        courseName: 'Coursera',
        courseDetail: 'Data Science',
        rating: 4,
        imagePath: 'assets/images/coursera.jpg',
        showAddReviewButton: true,
      ),
      _buildCourseCard(
        courseName: 'NPTEL',
        courseDetail: 'Introduction to Robotics',
        rating: 4,
        imagePath: 'assets/images/nptel.jpg',
        showAddReviewButton: true,
      ),
      _buildCourseCard(
        courseName: 'Udemy',
        courseDetail: 'Artificial Intelligence',
        rating: 5,
        imagePath: 'assets/images/udemy.jpg',
        showAddReviewButton: true,
      ),
      _buildCourseCard(
        courseName: 'Google',
        courseDetail: 'Data Visualisation Tools',
        rating: 5,
        imagePath: 'assets/images/google.jpg',
        showAddReviewButton: true,
      ),
    ];
  }

  List<Widget> _buildUpcomingCourses() {
    return [
      _buildCourseCard(
        courseName: 'NPTEL',
        courseDetail: 'Machine Learning',
        rating: 4,
        imagePath: 'assets/images/nptel.jpg',
        showAddReviewButton: false,
      ),
      _buildCourseCard(
        courseName: 'Google',
        courseDetail: 'Threat and Security',
        rating: 5,
        imagePath: 'assets/images/google.jpg',
        showAddReviewButton: false,
      ),
      _buildCourseCard(
        courseName: 'Udemy',
        courseDetail: 'AI/ML',
        rating: 5,
        imagePath: 'assets/images/udemy.jpg',
        showAddReviewButton: false,
      ),
    ];
  }

  // Course card widget
  Widget _buildCourseCard({
    required String courseName,
    required String courseDetail,
    required int rating,
    required String imagePath,
    required bool showAddReviewButton,
  }) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 30,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    courseName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(courseDetail),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4.0),
                      Text('$rating'),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.bookmark_border),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to CourseDescriptionPage and pass course details
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) =>  CourseDescriptionPage(
                          courseName: 'google',
                          courseDetail:'Data Visualisation Tools' ,
                          description: 'The Google Data Visualization Course is a comprehensive program designed to equip participants with the skills and knowledge needed to transform raw data into meaningful and visually engaging insights. This course covers essential data visualization concepts and tools, focusing on practical techniques to effectively communicate data-driven stories',// Pass course name
                         imageUrl:'assets/images/google.jpg', // Pass course detail
                      ),
                    ),
                  );
                  },
                  child: const Text('View Details'),
                ),
                const SizedBox(height: 8.0),
                if (showAddReviewButton)
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to CourseReviewPage and pass course name
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  CourseReviewPage (
                            Name:'google' ,
                            courseName: 'Data Analyatics',
                            Course: 'google',
                            imageUrl: 'assets/images/google.jpg', // Pass course name
                          ),
                        ),
                      );
                    },
                    child: const Text('Add Review'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_road_outlined),
          label: 'Roadmap',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Courses',
        ),
      ],
      currentIndex: 2,
      selectedItemColor: const Color.fromARGB(255, 41, 10, 105),
      onTap: (index) {
        // Handle tab switch logic if needed
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
          else  if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => StudentHomePagenew()
                ), // Navigating to ChatApp
            );
          }
      },
    );
  }
}

