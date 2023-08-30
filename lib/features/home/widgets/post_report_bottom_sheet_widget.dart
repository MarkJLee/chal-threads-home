import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostReportBottomSheetWidget extends StatelessWidget {
  PostReportBottomSheetWidget({super.key});

  List<String> reportReasons = [
    "I just dont't like it",
    "It's spam",
    "Nudity or sexual activity",
    "Hate speech or symbols",
    "Bullying or harassment",
    "False information",
    "Scam or fraud",
    "Violence or dangerous organizations",
    "Suicide or self-injury",
    "Intellectual property violation",
    "Sale or illegal or regulated goods",
    "Eating disorders",
    "Something else",
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const Text(
            "Report",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Why are you reporting this thread?",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 20),
                Divider(
                  color: Colors.grey.shade500,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              separatorBuilder: (context, index) => const Divider(
                color: Colors.grey,
              ),
              itemCount: reportReasons.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(reportReasons[index]),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 0,
                  ),
                  trailing: const FaIcon(
                    FontAwesomeIcons.chevronRight,
                    size: 16,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
