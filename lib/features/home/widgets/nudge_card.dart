import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NudgeCard extends StatelessWidget {
  final String title;
  final String description;

  const NudgeCard({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFBFCAC),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/icons/nudge_icon.svg',
            width: 46,
            height: 46,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                    color: Color(0xFF000000),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 1.42,
                    color: Color(0xFF5A5C63),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          SizedBox(
            width: 24,
            height: 24,
            child: Padding(
              padding: const EdgeInsets.all(4.6),
              child: SvgPicture.asset(
                'assets/icons/close_icon.svg',
                width: 14.8,
                height: 14.8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}