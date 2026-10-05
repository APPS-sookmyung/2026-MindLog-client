import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WeeklyStatusCard extends StatelessWidget {
  final int? previousAverageScore;
  final int? currentAverageScore;
  final List<int> dailyScores;

  const WeeklyStatusCard({
    super.key,
    required this.previousAverageScore,
    required this.currentAverageScore,
    required this.dailyScores,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //문구
          const Text(
            '이번 주 평균 불안 수치예요',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              height: 1.5,
              color: Color(0xFF171719),
            ),
          ),

          const SizedBox(height: 8),

          // 연두색 전체 카드
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFE6FFD4),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 상승 문구
                _WeeklyDifference(
                  previousAverageScore: previousAverageScore,
                  currentAverageScore: currentAverageScore,
                ),

                const SizedBox(height: 8),

                // 점수 + 그래프
                SizedBox(
                  height: 91,
                  child: Row(
                    children: [
                      Expanded(
                        child: _AverageScore(
                          score: currentAverageScore ?? 0,
                        ),
                      ),

                      const SizedBox(width: 32),

                      _WeeklyGraph(
                        dailyScores: dailyScores,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


/// 지난 주와의 차이를 보여주는 영역
class _WeeklyDifference extends StatelessWidget {
  final int? previousAverageScore;
  final int? currentAverageScore;

  const _WeeklyDifference({
    required this.previousAverageScore,
    required this.currentAverageScore,
  });

  @override
  Widget build(BuildContext context) {
    // 이번 주 기록이 없는 경우
    if (currentAverageScore == null) {
      return const Text(
        '불안한 상황이 없었어요',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          height: 1.5,
          color: Colors.black,
        ),
      );
    }

    // 지난 주 기록이 없고, 이번 주 기록만 있는 경우
    if (previousAverageScore == null) {
      return _buildDifferenceText(
        score: currentAverageScore!,
        message: '상승했어요',
      );
    }

    // 지난 주와 이번 주 모두 기록이 있는 경우
    if (previousAverageScore! > currentAverageScore!) {
      final difference =
          previousAverageScore! - currentAverageScore!;

      return _buildDifferenceText(
        score: difference,
        message: '상승했어요',
      );
    }

    if (previousAverageScore! < currentAverageScore!) {
      final difference =
          currentAverageScore! - previousAverageScore!;

      return _buildDifferenceText(
        score: difference,
        message: '떨어졌어요',
      );
    }

    // 지난 주 = 이번 주
    return _buildDifferenceText(
      score: 0,
      message: '상승했어요',
    );
  }

  Widget _buildDifferenceText({
    required int score,
    required String message,
  }) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/icons/weekly_arrow_up.svg',
          width: 16,
          height: 16,
        ),

        const SizedBox(width: 4),

        RichText(
          text: TextSpan(
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              height: 1.5,
              color: Colors.black,
            ),
            children: [
              const TextSpan(
                text: '지난 주보다 ',
              ),

              TextSpan(
                text: '$score점',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF48AD00),
                ),
              ),

              TextSpan(
                text: ' $message',
              ),
            ],
          ),
        ),
      ],
    );
  }
}


/// 왼쪽의 점수 영역
class _AverageScore extends StatelessWidget {
  final int score;

  const _AverageScore({
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 91,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            '$score',
            style: const TextStyle(
              fontSize: 56,
              fontWeight: FontWeight.w400,
              height: 1,
              color: Color(0xFF429E00),
            ),
          ),

          const SizedBox(width: 4),

          const Padding(
            padding: EdgeInsets.only(bottom: 6),
            child: Text(
              '점',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                height: 1.4,
                letterSpacing: -0.24,
                color: Color(0xFF347D00),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


/// 월~일 전체 그래프
class _WeeklyGraph extends StatelessWidget {
  final List<int> dailyScores;

  const _WeeklyGraph({
    required this.dailyScores,
  });

  static const List<String> _days = [
    '월',
    '화',
    '수',
    '목',
    '금',
    '토',
    '일',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 91,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(7, (index) {
          final score = index < dailyScores.length
              ? dailyScores[index]
              : 0;

          return Padding(
            padding: EdgeInsets.only(
              right: index == 6 ? 0 : 6,
            ),
            child: _DailyBar(
              day: _days[index],
              score: score,
            ),
          );
        }),
      ),
    );
  }
}


/// 하루치 막대 + 요일
class _DailyBar extends StatelessWidget {
  final String day;
  final int score;

  const _DailyBar({
    required this.day,
    required this.score,
  });

  static const List<Color> _blockColors = [
    Color(0xFFAEF779),
    Color(0xFF88F03E),
    Color(0xFF6BE016),
    Color(0xFF58CF04),
    Color(0xFF48AD00),
  ];

  int get blockCount {
    final safeScore = score.clamp(0, 100);

    if (safeScore <= 20) {
      return 1;
    } else if (safeScore <= 40) {
      return 2;
    } else if (safeScore <= 60) {
      return 3;
    } else if (safeScore <= 80) {
      return 4;
    } else {
      return 5;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 18,
      height: 91,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // 그래프 블록
          Column(
            mainAxisSize: MainAxisSize.min,
            children: _blockColors
              .take(blockCount)
              .toList()
              .reversed
              .map(
                (color) => Container(
                  width: 18,
                  height: 15,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              )
              .toList(),
          ),

          const SizedBox(height: 2),

          // 요일
          Text(
            day,
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              height: 1.3,
              color: Color(0xFF429E00),
            ),
          ),
        ],
      ),
    );
  }
}