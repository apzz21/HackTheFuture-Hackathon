// lib/course.dart

class Course {
  final String courseName;
  final String courseDetail;
  final int rating;
  final String imagePath;
  final bool showAddReviewButton;

  Course({
    required this.courseName,
    required this.courseDetail,
    required this.rating,
    required this.imagePath,
    required this.showAddReviewButton,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      courseName: json['courseName'],
      courseDetail: json['courseDetail'],
      rating: json['rating'],
      imagePath: json['imagePath'],
      showAddReviewButton: json['showAddReviewButton'],
    );
  }
}