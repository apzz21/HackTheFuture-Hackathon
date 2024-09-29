import 'package:flutter/material.dart';

void main() {
  runApp(RoadmapApp());
}

class RoadmapApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roadmap Generator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: RoadmapPage(),
    );
  }
}

class RoadmapPage extends StatefulWidget {
  @override
  _RoadmapPageState createState() => _RoadmapPageState();
}

class _RoadmapPageState extends State<RoadmapPage> {
  String selectedRoadmap = 'Cybersecurity';
  final List<String> roadmapOptions = ['Cybersecurity', 'Data Science', 'AI'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Roadmap Generator'),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 41, 10, 105),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Select a Roadmap: ',
                  style: TextStyle(fontSize: 18.0,fontWeight:FontWeight.bold,color: const Color.fromARGB(255, 41, 10, 105) ),
                ),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedRoadmap,
                  items: roadmapOptions
                      .map((option) => DropdownMenuItem(
                            value: option,
                            child: Text(option),
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedRoadmap = value!;
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: selectedRoadmap == 'Cybersecurity'
                    ? CybersecurityRoadmap()
                    : selectedRoadmap == 'Data Science'
                        ? DataScienceRoadmap()
                        : AIDiagram(), // AI Roadmap
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Cybersecurity Roadmap Diagram
class CybersecurityRoadmap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RoadmapBlock(
            title: 'Fundamentals',
            subtitle: 'Networking, OS',
          ),
        ),
        VerticalLine(),
        Wrap(
          spacing: 16.0, // Space between blocks
          alignment: WrapAlignment.center,
          children: [
            RoadmapBlock(
              title: 'Networking Basics',
              subtitle: 'Protocols, TCP',
            ),
            RoadmapBlock(
              title: 'Operating Systems',
              subtitle: 'Linux, Windows',
            ),
          ],
        ),
        VerticalLine(),
        RoadmapBlock(
          title: 'Cybersecurity Basics',
          subtitle: 'Threats, Mitigations',
        ),
        VerticalLine(),
        RoadmapBlock(
          title: 'Security Tools & Skills',
          subtitle: 'Wireshark, Nmap',
        ),
        VerticalLine(),
        Wrap(
          spacing: 16.0, // Space between blocks
          alignment: WrapAlignment.center,
          children: [
            RoadmapBlock(
              title: 'Penetration Testing',
              subtitle: 'Vulnerability Analysis',
            ),
            RoadmapBlock(
              title: 'Ethical Hacking',
              subtitle: 'Recon, Exploits',
            ),
          ],
        ),
        VerticalLine(),
        RoadmapBlock(
          title: 'Advanced Topics',
          subtitle: 'Cryptography, Malware',
        ),
        VerticalLine(),
        RoadmapBlock(
          title: 'Security Management',
          subtitle: 'Policies, Compliance',
        ),
      ],
    );
  }
}

// Data Science Roadmap Diagram
class DataScienceRoadmap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RoadmapBlock(
            title: 'Fundamentals',
            subtitle: 'Mathematics, Statistics',
          ),
        ),
        VerticalLine(),
        RoadmapBlock(
          title: 'Data Analysis',
          subtitle: 'Exploratory Data Analysis (EDA)',
        ),
        VerticalLine(),
        RoadmapBlock(
          title: 'Data Engineering',
          subtitle: 'Data Pipelines, ETL',
        ),
        VerticalLine(),
        RoadmapBlock(
          title: 'Machine Learning',
          subtitle: 'Supervised & Unsupervised Learning',
        ),
        VerticalLine(),
        Wrap(
          spacing: 16.0, // Space between blocks
          alignment: WrapAlignment.center,
          children: [
            RoadmapBlock(
              title: 'Deep Learning',
              subtitle: 'Neural Networks, CNNs',
            ),
            RoadmapBlock(
              title: 'Natural Language Processing',
              subtitle: 'Text Processing, Sentiment Analysis',
            ),
          ],
        ),
        VerticalLine(),
        RoadmapBlock(
          title: 'Deployment',
          subtitle: 'Model Deployment, Monitoring',
        ),
      ],
    );
  }
}

// AI Roadmap Diagram
class AIDiagram extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: RoadmapBlock(
            title: 'AI Fundamentals',
            subtitle: 'Mathematics, Programming',
          ),
        ),
        VerticalLine(),
        RoadmapBlock(
          title: 'Machine Learning Basics',
          subtitle: 'Regression, Classification',
        ),
        VerticalLine(),
        Wrap(
          spacing: 16.0, // Space between blocks
          alignment: WrapAlignment.center,
          children: [
            RoadmapBlock(
              title: 'Supervised Learning',
              subtitle: 'Linear Models, Trees',
            ),
            RoadmapBlock(
              title: 'Unsupervised Learning',
              subtitle: 'Clustering, PCA',
            ),
          ],
        ),
        VerticalLine(),
        RoadmapBlock(
          title: 'Deep Learning',
          subtitle: 'Neural Networks, CNNs, RNNs',
        ),
        VerticalLine(),
        Wrap(
          spacing: 16.0, // Space between blocks
          alignment: WrapAlignment.center,
          children: [
            RoadmapBlock(
              title: 'Computer Vision',
              subtitle: 'Image Processing, CNNs',
            ),
            RoadmapBlock(
              title: 'Natural Language Processing',
              subtitle: 'Text Classification, Transformers',
            ),
          ],
        ),
        VerticalLine(),
        RoadmapBlock(
          title: 'Reinforcement Learning',
          subtitle: 'Q-Learning, Policy Gradients',
        ),
        VerticalLine(),
        RoadmapBlock(
          title: 'AI Deployment & Ethics',
          subtitle: 'Deployment, Ethical Considerations',
        ),
      ],
    );
  }
}

// A widget representing each block in the roadmap
class RoadmapBlock extends StatelessWidget {
  final String title;
  final String subtitle;

  RoadmapBlock({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 250.0), // Set max width
      margin: EdgeInsets.symmetric(vertical: 16.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[50],
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: const Color.fromARGB(255, 139, 99, 182)),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 41, 10, 105),
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14.0, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}

// A widget to represent a vertical line (connector)
class VerticalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 4.0,
      color: const Color.fromARGB(255, 120, 89, 188),
      margin: EdgeInsets.symmetric(vertical: 16.0),
    );
  }
}
