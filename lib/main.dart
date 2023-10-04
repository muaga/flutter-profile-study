import 'package:flutter/material.dart';
import 'package:flutter_profile_ex01/components/profile_buttons.dart';
import 'package:flutter_profile_ex01/components/profile_count_info.dart';
import 'package:flutter_profile_ex01/components/profile_drawer.dart';
import 'package:flutter_profile_ex01/components/profile_header.dart';
import 'package:flutter_profile_ex01/components/profile_tab.dart';
import 'package:flutter_profile_ex01/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: ProfilePage(),
    );
  }
}

// 단일 page로 여기에 바로 Scaffold를 그린다.
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        endDrawer:
            ProfileDrawer(), // Scaffold의 속성 : Drawer(슬라이드-햄버거) * 왼 -> 오 : endDrawer
        appBar: _buildProfileAppBar(), // AppBar
        body: Column(
          children: [
            SizedBox(height: 20),
            ProfileHeader(), // 프로필사진 + 정보
            SizedBox(height: 20),
            ProfileCountInfo(), // 프로필 좋아요
            SizedBox(height: 20),
            ProfileButtons(), // 버튼
            Expanded(child: ProfileTab()), //
            // Expanded : 남아 있는 세로 공간을 모두 Tab이 차지
          ],
        ));
  }

  AppBar _buildProfileAppBar() {
    return AppBar(
      leading: Icon(Icons.arrow_back_ios), // leading 자리의 아이콘
      title: Text("Profile"),
      centerTitle: true, // title을 가운데 정렬로
    );
  }
}
