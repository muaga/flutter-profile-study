import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildHeaderAvatar("avatar"),
          SizedBox(width: 20),
          _buildHeaderProfile(
            "Getint there",
            "프로그래머/작가/강사",
            "데어 프로그램",
          ),
          SizedBox(width: 20),
        ],
      ),
    );
  }

  Widget _buildHeaderProfile(String name, String job, String jobDetail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${name}",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
        Text(
          "${job}",
          style: TextStyle(fontSize: 20),
        ),
        Text(
          "${jobDetail}",
          style: TextStyle(fontSize: 15),
        )
      ],
    );
  }

  Widget _buildHeaderAvatar(String avatarImage) {
    return SizedBox(
      width: 100,
      height: 100,
      child: CircleAvatar(
        backgroundImage: AssetImage("assets/${avatarImage}.png"),
      ),
    );
  }
}
