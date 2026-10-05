import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QuickEntryButtons extends StatelessWidget {
  const QuickEntryButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '불안을 바로 기록해 볼까요?',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              height: 1.5,
              color: Color(0xFF171719),
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              Expanded(
                child: _QuickEntryCard(
                  backgroundColor: Color(0xFFFED9C4),
                  iconPath: 'assets/images/CH_before.svg',
                  title: 'Before',
                  description: '상황 전 불안을 기록해요',
                ),
              ),

              const SizedBox(width: 8),

              Expanded(
                child: _QuickEntryCard(
                  backgroundColor: Color(0xFFDBD3FE),
                  iconPath: 'assets/images/CH_after.svg',
                  title: 'After',
                  description: '상황 후 결과를 기록해요',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickEntryCard extends StatelessWidget {
  final Color backgroundColor;
  final String iconPath;
  final String title;
  final String description;

  const _QuickEntryCard({
    required this.backgroundColor,
    required this.iconPath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 46,
            height: 46,
          ),

          const SizedBox(height: 8),

          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              height: 1.5,
              color: Colors.black,
            ),
          ),

          Text(
            description,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              height: 1.35,
              color: Color(0xFF46474C),
            ),
          ),
        ],
      ),
    );
  }
}