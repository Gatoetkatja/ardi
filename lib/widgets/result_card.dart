import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final String title;
  final String description;
  final String characteristics;
  final String tips;
  final IconData icon;
  final Color color;

  const ResultCard({
    super.key,
    required this.title,
    required this.description,
    required this.characteristics,
    required this.tips,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 32.0,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black87,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24.0),
          Text(
            'Characteristics:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            characteristics,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24.0),
          Text(
            'Learning Tips:',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 8.0),
          Text(
            tips,
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
