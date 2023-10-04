import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width: 20),
        _buildHeaderAvatar(),
        SizedBox(width: 20),
        _buildHeaderProfile(),
      ],
    );
  }

  // 프로필 사진
  Widget _buildHeaderAvatar() {
    return SizedBox(
      width: 100,
      height: 100,
      child: CircleAvatar(
        // 프로필 사진 원 모양으로 나타낼 때 자주 사용하는 방법
        backgroundImage: AssetImage("assets/avatar.png"),
        // AssetImage : 이미지 로드, 해당 이미지가 CircleAvatar의 배경이미지가 된다.
      ),
    );
  }

  // 프로필 정보
  Widget _buildHeaderProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Getin There",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "프로그래머/작가/강사",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          "데어 프로그래밍",
          style: TextStyle(
            fontSize: 15,
          ),
        )
      ],
    );
  }
}
