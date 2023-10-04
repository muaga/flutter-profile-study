import 'package:flutter/material.dart';

class ProfileButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildFollowButton(),
        _buildMessageButton(),
      ],
    );
  }

  // 팔로우 버튼
  Widget _buildFollowButton() {
    return InkWell(
      onTap: () {
        print("Follow 버튼 클릭됨");
        // 버튼 클릭 시 콘솔에 띄우는 메세지
      },
      child: Container(
        // 버튼 box
        alignment: Alignment.center, // 가운데 정렬
        width: 150,
        height: 45,
        child: Text(
          "Follow",
          style: TextStyle(color: Colors.white),
        ),
        decoration: BoxDecoration(
          // 버튼 속성
          color: Colors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // 메세지 버튼
  Widget _buildMessageButton() {
    return InkWell(
      onTap: () {
        print("message 버튼 클릭됨");
      },
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 45,
        child: Text(
          "Message",
          style: TextStyle(color: Colors.blue),
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
