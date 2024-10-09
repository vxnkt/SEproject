import 'package:flutter/material.dart';

class CancerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background color
      appBar: AppBar(
        title: Text(
          'Cancer Prediction',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.pink, // Modern teal color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),

              // Age Input
              _buildTitle('Age'),
              _buildTextField('Enter your age'),

              SizedBox(height: 16),

              // Gender Dropdown
              _buildTitle('Gender'),
              _buildDropdown(
                hint: 'Select Gender',
                items: ['Male', 'Female', 'Other'],
                onChanged: (value) {},
              ),

              SizedBox(height: 20),

              // Instruction Text
              Text(
                'On a scale from 1 (lowest) to 9 (highest), update the following:',
                style: TextStyle(fontSize: 16.0, color: Colors.grey[800]),
              ),

              SizedBox(height: 16),

              // Health Factors
              _buildTitle('Air Pollution'),
              _buildTextField('Rate on scale'),

              SizedBox(height: 16),

              _buildTitle('Alcohol Use'),
              _buildTextField('Rate on scale'),

              SizedBox(height: 16),

              _buildTitle('Dust Allergy'),
              _buildTextField('Rate on scale'),

              SizedBox(height: 16),

              _buildTitle('Occupational Hazards'),
              _buildTextField('Rate on scale'),

              SizedBox(height: 16),

              _buildTitle('Genetic Risk'),
              _buildTextField('Rate on scale'),

              SizedBox(height: 16),

              _buildTitle('Chronic Lung Disease'),
              _buildTextField('Rate on scale'),

              SizedBox(height: 16),

              _buildTitle('Balanced Diet'),
              _buildTextField('Rate on scale'),

              SizedBox(height: 16),

              _buildTitle('Obesity'),
              _buildTextField('Rate on scale'),

              SizedBox(height: 16),

              _buildTitle('Smoking'),
              _buildTextField('Rate on scale'),

              // Add more fields similarly...

              SizedBox(height: 32),

              // Submit Button
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Add form submission logic here
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 228, 22, 91),
                          Color.fromARGB(255, 250, 125, 167)
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                      borderRadius: BorderRadius.circular(12.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Text(
                      'Predict',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Title for each input field
  Widget _buildTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 18, color: Colors.grey[800]),
    );
  }

  // General text field with rounded borders
  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hintText,
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }

  // Dropdown with custom styling
  Widget _buildDropdown({
    required String hint,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(hint),
        underline: SizedBox(),
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
