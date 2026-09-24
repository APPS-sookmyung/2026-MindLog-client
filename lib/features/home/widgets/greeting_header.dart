import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GreetingHeader extends StatelessWidget {
  const GreetingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // MindLog 로고 , 알림 아이콘
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  'assets/icons/mindlog_logo.svg',
                  width: 85.586,
                  height: 24,
                ),
                SvgPicture.asset(
                  'assets/icons/notification.svg',
                  width: 24,
                  height: 24,
                ),
              ],
            ),
  

          const SizedBox(height: 28),

          // 사용자 인사말
          const Text(
            '좋은 아침이에요, 예선님',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 1.5,
              color: Color(0xFF70737C),
            ),
          ),

          const SizedBox(height: 2),

          // 홈 화면 메인 문구
          const Text(
            '오늘은 어떤 일이 있나요?',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
              height: 1.4,
              color: Color(0xFF000000),
            ),
          ),
        ],
      ),
    );
  }
}