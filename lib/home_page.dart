import 'package:flutter/material.dart';
import 'package:seproject/cancer_page.dart';
import 'package:seproject/diabetes_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light, modern background color
      appBar: AppBar(
        title: Text(
          "Genetica",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        elevation: 0, // Flat, clean app bar
        backgroundColor: Colors.blueAccent, // Modern accent color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Diabetes button
            _buildMenuCard(
              context,
              title: 'Diabetes',
              description: 'Analyze and predict diabetes risk',
              color: Colors.blueAccent,
              icon: Icons.health_and_safety_outlined,
              page: DiabetesPage(),
            ),
            SizedBox(height: 20),
            // Cancer button
            _buildMenuCard(
              context,
              title: 'Lung Cancer',
              description: 'Health assessment for cancer risk',
              color: Colors.pinkAccent,
              icon: Icons.local_hospital_outlined,
              page: CancerPage(),
            ),
          ],
        ),
      ),
    );
  }

  // A reusable method for building each card button
  Widget _buildMenuCard(BuildContext context,
      {required String title,
      required String description,
      required Color color,
      required IconData icon,
      required Widget page}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.9), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: Offset(0, 4), // creates a slight shadow effect
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white70,
                    ),
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
