import 'package:flutter/material.dart';

class ProfileCountInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildInfo("50", "Posts"), // 컴포넌트 + 매개변수
        _buildLine(),
        _buildInfo("10", "Likes"),
        _buildLine(),
        _buildInfo("3", "Share"),
      ],
    );
  }

  // 프로필 좋아요 정보
  Widget _buildInfo(String count, String title) {
    return Column(
      children: [
        Text(
          count, // 변수 바인딩
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(height: 2),
        Text(
          title,
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }

  // 라인
  Widget _buildLine() {
    return Container(width: 2, height: 60, color: Colors.blue);
  }
}
