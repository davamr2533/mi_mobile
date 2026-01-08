import 'package:flutter/material.dart';

class KonsentrasiCard extends StatefulWidget {
  final String image;
  final String title;
  final String description;

  const KonsentrasiCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  State<KonsentrasiCard> createState() => _KonsentrasiCardState();
}

class _KonsentrasiCardState extends State<KonsentrasiCard>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFCC4D),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  widget.image,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  widget.title,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4C21A4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? 'Tutup Informasi' : 'Detail Informasi',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),

          // Expanded content
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            child: isExpanded
                ? Padding(
              padding: const EdgeInsets.only(top: 12),
              child: Text(
                widget.description,
                textAlign: TextAlign.justify,
                style:
                const TextStyle(fontSize: 15, height: 1.5),
              ),
            )
                : const SizedBox(),
          ),
        ],
      ),
    );
  }
}
