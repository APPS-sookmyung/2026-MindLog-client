import 'package:flutter/material.dart';

import '../widgets/greeting_header.dart';
import '../widgets/nudge_card.dart';
import '../widgets/quick_entry_buttons.dart';
import '../widgets/weekly_status_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GreetingHeader(),

              SizedBox(height: 28),

              NudgeCard( //s나중에 백엔드랑 연동
                title: '다음 주 발표 수업이 있어요.',
                description: 'Before를 기록해두면 어때요?',
              ),

              SizedBox(height: 36),

              QuickEntryButtons(),

              SizedBox(height: 36),

              //더미데이터
              WeeklyStatusCard(
                previousAverageScore: 80,
                currentAverageScore: 72,
                dailyScores: [
                  20,
                  15,
                  45,
                  85,
                  35,
                  0,
                  0,
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}