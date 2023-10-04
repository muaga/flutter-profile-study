import 'package:flutter/material.dart';

// Stateful = 상태 변화에 따라 화면이 업데이트
class ProfileTab extends StatefulWidget {
  @override
  _ProfileTabState createState() => _ProfileTabState();
  // createState() : 해당 위젯의 상태 관리(StatefulWidget 실행 될 때 무조건 호출)
}

class _ProfileTabState extends State<ProfileTab>
    with SingleTickerProviderStateMixin {
  TabController? _tabController; // -> 변수 선언
  // _ProfileTabState 클래스를 선언하고, State 클래스를 상속하여 StatefulWidget의 상태를 관리한다.
  // 또 SingleTickerProviderStateMixin을 mixin으로 사용하여 애니메이션을 처리할 수 있게 한다.
  // SingleTickerProviderStateMixin : 애니메이션 컨트롤러와 함께 사용되는 mixin 중 1개
  // mixin : vsync 속성을 통해 애니메이션을 동기화하고 제어하는 데 사용 - 모듈화/재사용, with 키워드 사용

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }
  // initstate() : StatefulWidget에만 존재하는 초기화를 위한 함수, Tab 위젯이 핸드폰에 그림이 그려질 때, 딱 1번 실행된다.
  // StatefulWidget의 초기 상태 설정 -> TabController 객체를 초기화 해서 2개의 탭을 가지고, vsync에 this를 전달하여 애니메이션을 위한 vsync를 제공한다.

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTabBar(),
        Expanded(child: _buildTabBarView()),
      ],
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      controller: _tabController,
      tabs: const [
        Tab(
            icon: Icon(
          Icons.directions_car,
        )),
        Tab(
            icon: Icon(
          Icons.directions_transit,
        )),
      ],
    );
  }

  // GridView에 들어올 item 개수가 동적일 때 사용하는 GridView.builder
  Widget _buildTabBarView() {
    return TabBarView(
      controller: _tabController, // 탭 바와 탭 바 뷰가 서로 동기화
      children: [
        GridView.builder(
          // grid view 생성 위젯
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            // grid의 레이아웃 정의
            crossAxisSpacing: 10, // 열 간격, 픽셀
            crossAxisCount: 3, // 열의 수
            mainAxisSpacing: 10, // 행 간격, 픽셀
          ),
          itemCount: 42, // grid에 나타낼 항목 갯수
          itemBuilder: (context, index) {
            return Image.network(// grid에 나타낼 이미지 링크
                "https://picsum.photos/id/${index + 1}/200/200");
          },
        ),
        Container(color: Colors.red),
      ],
    );
  }
}
