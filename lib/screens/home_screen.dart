import 'package:flutter/material.dart';
import '../main.dart';
import 'recording_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ProfessionalPitch'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue[50] ?? Colors.blue.shade50,
              Colors.white,
              Colors.blue[100] ?? Colors.blue.shade100,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App logo/icon
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue[800] ?? Colors.blue.shade800,
                    borderRadius: BorderRadius.circular(60),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.3),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.video_camera_front,
                    size: 60,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 40),

                // App title
                const Text(
                  'Professional Video Pitch',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 16),

                // App description
                const Text(
                  'Record your elevator pitch and showcase\nyour professional story to stand out\nin the competitive market',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 60),

                // Start recording button
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: () {
                      // Check if cameras are available
                      if (cameras.isEmpty) {
                        // Show error message for web or devices without cameras
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Camera not available on this device. Please run on mobile device for full functionality.',
                            ),
                            backgroundColor: Colors.orange,
                            duration: Duration(seconds: 3),
                          ),
                        );
                      } else {
                        // Navigate to recording screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RecordingScreen(),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[800] ?? Colors.blue.shade800,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 4,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.videocam, size: 24, color: Colors.white),
                        SizedBox(width: 12),
                        Text(
                          'Start Recording',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Tips section
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue[50] ?? Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                        color: Colors.blue[200] ?? Colors.blue.shade200),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tips for a great pitch:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[800] ?? Colors.blue.shade800,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        '• Keep it under 60 seconds\n'
                        '• Speak clearly and confidently\n'
                        '• Highlight your unique value\n'
                        '• Practice good lighting',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Status indicator
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: cameras.isEmpty
                        ? (Colors.orange[50] ?? Colors.orange.shade50)
                        : (Colors.green[50] ?? Colors.green.shade50),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: cameras.isEmpty
                          ? (Colors.orange[200] ?? Colors.orange.shade200)
                          : (Colors.green[200] ?? Colors.green.shade200),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        cameras.isEmpty ? Icons.warning : Icons.check_circle,
                        color: cameras.isEmpty
                            ? (Colors.orange[700] ?? Colors.orange.shade700)
                            : (Colors.green[700] ?? Colors.green.shade700),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          cameras.isEmpty
                              ? 'Run on mobile device for camera features'
                              : 'Camera ready! ${cameras.length} camera(s) available',
                          style: TextStyle(
                            color: cameras.isEmpty
                                ? (Colors.orange[700] ?? Colors.orange.shade700)
                                : (Colors.green[700] ?? Colors.green.shade700),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
