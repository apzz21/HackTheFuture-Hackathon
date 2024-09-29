import 'package:flutter/material.dart';

// Course Description Page accepting the course name, detail, and description
class CourseDescriptionPage extends StatefulWidget {
  final String courseName;
  final String courseDetail; // Course detail or specifics
  final String description; // User-provided description
  final String imageUrl; // Image URL for the course logo

  CourseDescriptionPage({
    required this.courseName,
    required this.courseDetail,
    required this.description, // New parameter for description
    required this.imageUrl,
  });

  @override
  _CourseDescriptionPageState createState() => _CourseDescriptionPageState();
}

class _CourseDescriptionPageState extends State<CourseDescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         title: const Text('Course Description'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 41, 10, 105),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Course Image
            CircleAvatar(
              backgroundImage: AssetImage(widget.imageUrl),
              radius: 40,
            ),
            const SizedBox(height: 16),
            // Course Name
            Text(
              widget.courseName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 8),
            // Divider
            Divider(color: Colors.grey),
            const SizedBox(height: 8),
            // Course Detail
            Text(
              widget.courseDetail,
              style: const TextStyle(color: Colors.black, fontSize: 16),
            ),
            const SizedBox(height: 8),
            // Divider
            Divider(color: Colors.grey),
            const SizedBox(height: 8),
            // User Input Description
            Text(
              'Description:',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 4),
            // Display the description passed to the widget
            Container(
              constraints: BoxConstraints(
                maxWidth: 350,
              ),
              child: Center(
                // Center alignment for description text
                child: Text(
                  widget.description,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify, // Center alignment for text
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // Bottom Navigation Bar (can be customized as per your app)
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
          icon: Icon(Icons.account_circle),
          label: 'Profile',
        ),
      ],
      currentIndex: 0, // Adjust as per navigation logic
      selectedItemColor: const Color.fromARGB(255, 41, 10, 105),
      onTap: (index) {
        // Handle navigation between pages here
      },
    );
  }
}

// Example navigation method
void navigateToCourseDescriptionPage(BuildContext context, String courseName,
    String courseDetail, String description, String imageUrl) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CourseDescriptionPage(
        courseName: courseName,
        courseDetail: courseDetail,
        description: description, // Pass the description parameter
        imageUrl: imageUrl,
      ),
    ),
  );
}
