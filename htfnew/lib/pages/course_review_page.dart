import 'package:flutter/material.dart';

class CourseReviewPage extends StatefulWidget {
  final String Name; // Doctor's name passed from another page
  final String Course; // Doctor's specialty passed from another page
  final String imageUrl; // Profile image URL passed from another page

  const CourseReviewPage({
    Key? key,
    required this.Name,
    required this.Course,
    required this.imageUrl, required String courseName,
  }) : super(key: key);

  @override
  _CourseReviewPageState createState() => _CourseReviewPageState();
}

class _CourseReviewPageState extends State<CourseReviewPage> {
  // Variable to track the selected rating
  int _rating = 0;

  // Function to build the stars dynamically
  Widget buildStar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _rating = index + 1; // Update the rating when a star is tapped
        });
      },
      child: Icon(
        index < _rating ? Icons.star : Icons.star_border,
        color:const Color.fromARGB(255, 41, 10, 105),
        size: 32,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Review',style:TextStyle(color: Colors.white) ,),
        backgroundColor: const Color.fromARGB(255, 41, 10, 105),
        centerTitle: true,
      ),
      // Fix to avoid overflow when the keyboard pops up
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Section
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage(widget.imageUrl), // Use passed image URL
            ),
            const SizedBox(height: 16),
            Text(
              widget.Name, // Use passed doctorName
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              widget.Course, // Use passed specialty
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),

            // Dynamic Rating Section (Interactive Stars)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) => buildStar(index)),
            ),
            const SizedBox(height: 16),

            // Comment Input Section
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Enter Your Comment Here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Add Review Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Handle review submission
                  print('Rating: $_rating');
                  // You can handle the submission logic here
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  backgroundColor: const Color.fromARGB(255, 41, 10, 105),
                ),
                child: const Text('Add Review',style: TextStyle(color: Colors.white),),
              ),
            ),
          ],
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 41, 10, 105),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
