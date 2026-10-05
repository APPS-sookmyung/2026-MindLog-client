import 'package:flutter/material.dart';

import '../widgets/greeting_header.dart';
import '../widgets/nudge_card.dart';
import '../widgets/quick_entry_buttons.dart';
import '../widgets/weekly_status_card.dart';
import '../widgets/recent_record_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GreetingHeader(),

              SizedBox(height: 28),

              NudgeCard( //나중에 백엔드랑 연동
                title: '다음 주 발표 수업이 있어요.',
                description: 'Before를 기록해두면 어때요?',
              ),

              SizedBox(height: 36),

              QuickEntryButtons(),

              SizedBox(height: 36),

              //더미데이터 -> 백엔드 API연동 후 실제 주간 데이터로 교체 
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

              const SizedBox(height: 36),

              RecentRecordList(
                records: [
                  RecentAnxietyRecord(
                    title: '팀 발표',
                    date: DateTime.now(),
                    beforeScore: 80,
                  ),
                  RecentAnxietyRecord(
                    title: '팀플 회의',
                    date: DateTime.now().subtract(
                      const Duration(days: 1),
                    ),
                    beforeScore: 80,
                    afterScore: 45,
                  ),
                  RecentAnxietyRecord(
                    title: '팀 발표',
                    date: DateTime(2026, 4, 25),
                    beforeScore: 80,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}