import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:seproject/results_page.dart';

class DiabetesPage extends StatefulWidget {
  @override
  _DiabetesPageState createState() => _DiabetesPageState();
}

class _DiabetesPageState extends State<DiabetesPage> {
  // Controllers for text fields
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bmiController = TextEditingController();
  TextEditingController hba1cController = TextEditingController();
  TextEditingController glucoseController = TextEditingController();

  // Variables for dropdowns
  String? gender;
  String? hypertension;
  String? heartDisease;
  String? smokingHistory;

  // Function to validate the age
  bool isValidAge(String ageText) {
    final age = int.tryParse(ageText);
    return age != null && age >= 0 && age <= 120;
  }

  // Function to show dialog for invalid age
  void showInvalidAgeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Invalid Age'),
          content: Text('Please enter a valid age (0 - 120, whole number).'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Light background color
      appBar: AppBar(
        title: Text(
          'Diabetes Prediction App',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white),
        ),
        backgroundColor: Colors.blue, // Modern teal color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Input
              _buildTitle('Enter Name'),
              _buildTextField(nameController, 'Enter your name'),

              SizedBox(height: 16),

              // Gender Dropdown
              _buildTitle('Gender'),
              _buildDropdown(
                value: gender,
                hint: 'Select Gender',
                items: ['Male', 'Female', 'Other'],
                onChanged: (value) {
                  setState(() {
                    gender = value;
                  });
                },
              ),

              SizedBox(height: 16),

              // Age Input with Increment and Decrement
              _buildTitle('Age'),
              _buildTextFieldWithCounter(ageController, 'Enter your age'),

              SizedBox(height: 16),

              // Hypertension Dropdown
              _buildTitle('Hypertension'),
              _buildDropdown(
                value: hypertension,
                hint: 'Select Hypertension',
                items: ['No', 'Yes'],
                onChanged: (value) {
                  setState(() {
                    hypertension = value;
                  });
                },
              ),

              SizedBox(height: 16),

              // Heart Disease Dropdown
              _buildTitle('Heart Disease'),
              _buildDropdown(
                value: heartDisease,
                hint: 'Select Heart Disease',
                items: ['No', 'Yes'],
                onChanged: (value) {
                  setState(() {
                    heartDisease = value;
                  });
                },
              ),

              SizedBox(height: 16),

              // Smoking History Dropdown
              _buildTitle('Smoking History'),
              _buildDropdown(
                value: smokingHistory,
                hint: 'Select Smoking History',
                items: ['never', 'former', 'current'],
                onChanged: (value) {
                  setState(() {
                    smokingHistory = value;
                  });
                },
              ),

              SizedBox(height: 16),

              // BMI Input with Increment and Decrement
              _buildTitle('BMI'),
              _buildTextFieldWithCounter(bmiController, 'Enter your BMI',
                  isDecimal: true),

              SizedBox(height: 16),

              // HbA1c Level Input
              _buildTitle('HbA1c Level'),
              _buildTextField(hba1cController, 'Enter your HbA1c level'),

              SizedBox(height: 16),

              // Blood Glucose Level Input
              _buildTitle('Blood Glucose Level'),
              _buildTextField(
                  glucoseController, 'Enter your blood glucose level'),

              SizedBox(height: 32),

              // Predict Button
              Center(
                child: GestureDetector(
                  onTap: () {
                    String ageText = ageController.text;

                    if (!isValidAge(ageText)) {
                      showInvalidAgeDialog(context);
                    } else {
                      print('Valid age, proceed with prediction logic');
                      _predictDiabetes;
                    }
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.blueAccent, Colors.lightBlueAccent],
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
  Widget _buildTextField(TextEditingController controller, String hintText) {
    return TextField(
      controller: controller,
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
    String? value,
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
        value: value,
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

  // Text field with increment and decrement buttons
  Widget _buildTextFieldWithCounter(
    TextEditingController controller,
    String hintText, {
    bool isDecimal = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintText: hintText,
        suffixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  double value = double.tryParse(controller.text) ?? 0;
                  value = value > 0 ? value - 1 : 0;
                  controller.text = isDecimal
                      ? value.toStringAsFixed(2)
                      : value.toStringAsFixed(0);
                });
              },
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  double value = double.tryParse(controller.text) ?? 0;
                  value += 1;
                  controller.text = isDecimal
                      ? value.toStringAsFixed(2)
                      : value.toStringAsFixed(0);
                });
              },
            ),
          ],
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    );
  }

  Future<void> _predictDiabetes() async {
    if (!isValidAge(ageController.text)) {
      showInvalidAgeDialog(context);
      return; // Stop execution if age is invalid
    }

    // Prepare the data for the request
    final requestBody = {
      'name': nameController.text,
      'gender': gender,
      'age': int.parse(ageController.text),
      'hypertension': hypertension,
      'heart_disease': heartDisease,
      'smoking_history': smokingHistory,
      'bmi': double.parse(bmiController.text),
      'HbA1c_level': double.parse(hba1cController.text),
      'blood_glucose_level': double.parse(glucoseController.text),
    };
    print('Request Body: $requestBody');

    // Send the POST request
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:5000/predict_diabetes'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      // Print the raw response body for debugging
      print('Response Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Print the decoded response data
        print('Decoded Response Data: $responseData');

        // Check if result is null
        if (responseData['result'] == null) {
          throw Exception('Prediction result is null');
        }

        final name = responseData['name']; // Get name from the response
        final result = responseData['result']; // Get result from the response

        // Navigate to ResultsPage with name and result
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultsPage(name: name, result: result),
          ),
        );
      } else {
        throw Exception('Failed to predict diabetes: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
      // Optionally show an error dialog to the user
      showErrorDialog(context, 'An error occurred: $error');
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
