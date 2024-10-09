import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final String name; // Define the name parameter
  final String result; // Define the result parameter

  // Constructor to accept parameters
  const ResultsPage({required this.name, required this.result, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Prediction Result',
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey, // Darker AppBar for contrast
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Greeting message
              Card(
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Hello, $name!',
                        style: const TextStyle(
                          fontSize: 20, // Adjusted font size
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Your Prediction Result:',
                        style: const TextStyle(
                          fontSize: 16, // Adjusted font size
                          fontWeight: FontWeight.w400,
                          color: Colors.black38,
                        ),
                      ),
                      const SizedBox(height: 10),
                      // Fade-in animation for the result
                      AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeIn,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 32),
                        decoration: BoxDecoration(
                          gradient: _getResultGradient(result),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: FadeInResultText(result: result),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Dietary and health measures section (to be populated later)
              if (result.toLowerCase() == 'moderate') ...[
                const Text(
                  'Dietary and Health Measures to Reduce Risk:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 10),
                // Placeholder for API call results
                Text(
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.'
                  '1. Increase fiber intake.\n'
                  '2. Engage in regular physical activity.\n'
                  '3. Maintain a balanced diet with whole grains.\n'
                  '4. Stay hydrated.\n'
                  '5. Limit processed foods and sugars.',
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  // Method to get a soft gradient based on prediction result
  LinearGradient _getResultGradient(String result) {
    switch (result.toLowerCase()) {
      case 'low':
        return const LinearGradient(
          colors: [Colors.green, Colors.lightGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'moderate':
        return const LinearGradient(
          colors: [Colors.orange, Colors.orangeAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      case 'high':
        return const LinearGradient(
          colors: [Colors.red, Colors.redAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        );
      default:
        return const LinearGradient(
          colors: [Colors.grey, Colors.grey],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ); // Fallback gradient
    }
  }
}

class FadeInResultText extends StatefulWidget {
  final String result;

  const FadeInResultText({required this.result, Key? key}) : super(key: key);

  @override
  _FadeInResultTextState createState() => _FadeInResultTextState();
}

class _FadeInResultTextState extends State<FadeInResultText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _opacity = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.forward(); // Start the animation
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: Center(
        child: Text(
          widget.result.toUpperCase(),
          style: const TextStyle(
            fontSize: 24, // Adjusted font size for the result
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
