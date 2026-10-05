import 'package:flutter/material.dart';

/// 최근 불안 기록 한 개의 데이터
class RecentAnxietyRecord {
  final String title;
  final DateTime date;
  final int beforeScore;
  final int? afterScore;

  const RecentAnxietyRecord({
    required this.title,
    required this.date,
    required this.beforeScore,
    this.afterScore,
  });

  /// After 점수가 있으면 완료
  bool get isCompleted => afterScore != null;
}

class RecentRecordList extends StatelessWidget {
  final List<RecentAnxietyRecord> records;
  final VoidCallback? onViewAll;

  const RecentRecordList({
    super.key,
    required this.records,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    // 홈에서는 최대 3개까지만 보여줌
    final visibleRecords = records.take(3).toList();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 제목 + 전체보기
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '최근 불안 기록이에요',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  height: 1.5,
                  color: Color(0xFF171719),
                ),
              ),

              // 기록이 있을 때만 전체보기 노출
              if (records.isNotEmpty)
                GestureDetector(
                  onTap: onViewAll,
                  child: const Text(
                    '전체보기',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                      letterSpacing: 0.203,
                      color: Color(0xFF727272),
                    ),
                  ),
                ),
            ],
          ),

          if (records.isEmpty) ...[
            // 기록이 없는 경우
            const SizedBox(height: 58),

            const Center(
              child: Text(
                '기록된 불안이 없어요',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  height: 1.42,
                  letterSpacing: 0.14,
                  color: Color(0xFF878A93),
                ),
              ),
            ),
          ] else ...[
            // 제목과 첫 번째 카드 사이
            const SizedBox(height: 8),

            // 최대 3개의 기록 카드 생성
            ...List.generate(
              visibleRecords.length,
              (index) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom:
                        index == visibleRecords.length - 1 ? 0 : 16,
                  ),
                  child: _RecentRecordCard(
                    record: visibleRecords[index],
                  ),
                );
              },
            ),
          ],
        ],
      ),
    );
  }
}


/// 불안 기록 카드 한 개
class _RecentRecordCard extends StatelessWidget {
  final RecentAnxietyRecord record;

  const _RecentRecordCard({
    required this.record,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7FBFF),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 왼쪽 텍스트 영역
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  record.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                    letterSpacing: 0.091,
                    color: Color(0xFF171719),
                  ),
                ),

                const SizedBox(height: 4),

                Text(
                  _buildRecordInfo(record),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    height: 1.42,
                    letterSpacing: 0.14,
                    color: Color(0xFF878A93),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // 진행중 / 완료
          _StatusBadge(
            isCompleted: record.isCompleted,
          ),
        ],
      ),
    );
  }
}


/// "오늘 | 예상 80 → 실제 45" 같은 문장 만들기
String _buildRecordInfo(RecentAnxietyRecord record) {
  final dateText = _formatDate(record.date);

  if (record.afterScore == null) {
    return '$dateText | 예상 ${record.beforeScore}';
  }

  return '$dateText | 예상 ${record.beforeScore} → 실제 ${record.afterScore}';
}


/// 날짜를 오늘 / 어제 / 04.25 형태로 바꾸기
String _formatDate(DateTime date) {
  final now = DateTime.now();

  final today = DateTime(
    now.year,
    now.month,
    now.day,
  );

  final recordDate = DateTime(
    date.year,
    date.month,
    date.day,
  );

  final difference = today.difference(recordDate).inDays;

  if (difference == 0) {
    return '오늘';
  }

  if (difference == 1) {
    return '어제';
  }

  final month = date.month.toString().padLeft(2, '0');
  final day = date.day.toString().padLeft(2, '0');

  return '$month.$day';
}


/// 진행중 / 완료 배지
class _StatusBadge extends StatelessWidget {
  final bool isCompleted;

  const _StatusBadge({
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 29,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCompleted
            ? const Color(0xFFACFCC7)
            : const Color(0xFFFED5D5),
        borderRadius: BorderRadius.circular(10000),
      ),
      child: Text(
        isCompleted ? '완료' : '진행중',

        maxLines: 1,
        softWrap: false,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          height: 1.5,
          letterSpacing: 0.203,
          color: isCompleted
              ? const Color(0xFF006E25)
              : const Color(0xFFB00C0C),
        ),
      ),
    );
  }
}