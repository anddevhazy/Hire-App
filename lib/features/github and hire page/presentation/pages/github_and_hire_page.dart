import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  Future<void> _launchGithubURL() async {
    final Uri url = Uri.parse('https://github.com/anddevhazy');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  Future<void> _launchHirePageURL() async {
    final Uri url = Uri.parse('https://hng.tech/hire/flutter-developers');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      debugPrint('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Anddevhazy Profile and Job Listings',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(title: "Linked Account"),
            const SizedBox(height: 10),

            // GitHub Card
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("GitHub",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Text("Since 2023",
                            style: TextStyle(color: Colors.grey)),
                      ],
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.person, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: _launchGithubURL,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text("View GitHub Profile"),
              ),
            ),

            const SizedBox(height: 20),

            // Divider between sections
            const Divider(thickness: 2),

            const SizedBox(height: 20),
            const SectionHeader(title: "Jobs Posted"),
            const SizedBox(height: 1),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Elite Flutter Developers",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.grey[300],
                      child: const Icon(Icons.code,
                          color: Colors.white), // Updated Icon
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: TextButton(
                onPressed: _launchHirePageURL,
                style: TextButton.styleFrom(
                  foregroundColor: Colors.green,
                  textStyle: const TextStyle(fontSize: 16),
                ),
                child: const Text("Find and Hire"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Icon(Icons.add_circle_outline, color: Colors.green, size: 24),
      ],
    );
  }
}
