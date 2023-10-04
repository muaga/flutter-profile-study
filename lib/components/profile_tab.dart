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
  // TabController : 탭을 제어하기 위한 컨트롤러로, ?는 null을 허용하겠다는 뜻.
  // null을 허용하는 이유
  /*애니메이션 컨트롤러의 초기화가 나중에 발생할 수 있음: _tabController는 initState 메서드에서 초기화됩니다. 그러나 initState는 위젯이 화면에 그려지기 전에 호출되므로, 초기화가 발생하기 전에 위젯이 빌드되거나 다른 부분에서 _tabController를 참조하려는 시나리오를 고려할 수 있습니다. 이런 경우를 대비하여 _tabController를 nullable로 선언하여 나중에 초기화할 수 있도록 합니다.

탭 컨트롤러의 상태 변화를 고려: 탭 컨트롤러가 상태를 관리하며, 앱의 생명주기에 따라 상태가 변할 수 있습니다. nullable로 선언된 _tabController를 사용하면 탭 컨트롤러의 상태 변화를 더 유연하게 처리할 수 있습니다.

위젯의 라이프사이클과 상호작용: Flutter 위젯의 라이프사이클은 여러 단계로 나누어집니다. _tabController를 nullable로 선언하면 위젯의 라이프사이클과 상호작용하며 필요한 시점에 초기화하거나 해제할 수 있습니다.
  */

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
  }

  // initstate() : StatefulWidget에만 존재하는 초기화를 위한 함수, Tab 위젯이 핸드폰에 그림이 그려질 때, 딱 1번 실행된다.
  // 여기서 말하는 초기화란, StateWidget 객체를 생성하는 초기화로, 생성되면 상태가 유지된다.
  // StatefulWidget의 초기 상태 설정 -> TabController 객체를 초기화 해서 2개의 탭을 가지고, vsync에 this를 전달하여 애니메이션을 위한 vsync를 제공한다.
  // vsync : 애니메이션 컨트롤러와 같은 시간에 관련된 동기화를 처리하기 위한 매개변수 = 화면 업데이트 동기화
  // this : 생성자 = 현재 위젯의 상태를 제공하는 statefulWidget

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
