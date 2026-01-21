import 'package:flutter/material.dart';

class MealLogCard extends StatelessWidget {
  final String date;
  final String pokok;
  final String sayur;
  final String lauk;
  final String buah;
  final VoidCallback onEdit;

  const MealLogCard({
    super.key,
    required this.date,
    required this.pokok,
    required this.sayur,
    required this.lauk,
    required this.buah,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryTeal = Color(0xFF90AFBA);
    const Color accentTeal = Color(0xFFA5C1CC);

    return Container(
      decoration: BoxDecoration(
        color: primaryTeal,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 4, 8, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                IconButton(
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit, color: Colors.black87, size: 22),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Row(
              children: [
                _HeaderLabel(text: 'Pokok'),
                _HeaderLabel(text: 'Sayur'),
                _HeaderLabel(text: 'Lauk'),
                _HeaderLabel(text: 'Buah'),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
              color: accentTeal.withOpacity(0.6),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Row(
              children: [
                _ValueLabel(text: pokok),
                _ValueLabel(text: sayur),
                _ValueLabel(text: lauk),
                _ValueLabel(text: buah),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderLabel extends StatelessWidget {
  final String text;
  const _HeaderLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white, fontSize: 14),
      ),
    );
  }
}

class _ValueLabel extends StatelessWidget {
  final String text;
  const _ValueLabel({required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
