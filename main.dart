

import 'package:flutter/material.dart';
// 프로그램 실행을 위해 main 이 필요함.
void main(){
  // 플러터는 프레임 워크 -> 제어의 역전
  // 앱을 실행시켜줘 (개발자가 프레임 워크에 요정)
  // 매개변수는 widget
  // const는 컴파일 시점에 데이터 고정
  // 바뀌지 않는 화면일 경우만 사용
  // 필요하지 않은 화면에는 무조건 const 붙이기
  // 데이터를 주입하는 위젯에는 const 사용
  runApp(const MyApp3());
}

// 위젯
// 화면을 그리는 단위
// 위젯 클래스를 사용하면 build 메서드가 살향된다
// html의 태그와 같은 역할
// StatelessWidget 고정된 하면을 만든다
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp 안드로이드 스타일 앱 제작 위젯
    //

    return MaterialApp(
      // title : 앱의 제목
      title: "MyApp",
      // theme : 앱의 색상, 글꼴 / themeData 객체
//    theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      // routes 생략
      // locale : 앱의 언어를 사용하는 언어에 맞게 설정할수 있다
      // home : 앱 실행시 표시되는 위젯
      home: Scaffold(
        // Scaffold 바닥
        // 앱 구조의 기반을 만드는 위젯
        // AppBar : 제목, 뒤로가기, 햄버거버튼 등
        appBar: AppBar(
          title: Text("MyApp"),
        ),
        // drawer : 서랍, 사이드 메뉴 등
        drawer: Drawer(),
        // bottomNavigationBar : 화면 이동 네비게이션
        bottomNavigationBar: BottomNavigationBar(
          items: const[
            BottomNavigationBarItem(
              label: "add",
                icon: Icon(Icons.add)
            ),
            BottomNavigationBarItem(
              label: "remove",
                icon: Icon(Icons.remove)
            )
          ],
        ),
        // floatingActionButton : 화면 위에 떠있는 버튼
        floatingActionButton: FloatingActionButton(
          onPressed: (){  },
        ),
        body: SafeArea(
          // 폰 기종마다 다른 노지, 알림바 등을 피해서
          // 화면을 노출한다
          // Scaffold - SafeArea 조합은 기본적으로 사용

          child: Center(
            child: Text("안녕"),
          ),
        ),
      ),
    );

  }
}


class MyApp2 extends StatefulWidget {
  const MyApp2({Key? key}) : super(key: key);

  @override
  State<MyApp2> createState() => _MyApp2State();

}

class _MyApp2State extends State<MyApp2> {
  // Strat 안에 변수는 관찰된다
  // 변수의 값의 바뀌면 화면이 바뀐다
  int count = 0;

  int navIndex = 0;

  void changeNavIndex(int index){
    setState(() {
      navIndex = index;
    });
  }

  List _items = [
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    )
  ];

  // void increaseCount(){
  //   // Stateful 변수를 변경할 대에는
  //   // 무조건 setState 함수를 사용
  //   setState(() {
  //     count++;
  //   });
  // }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navIndex,
          // onTap: changeNavIndex,
          onTap: (index) => changeNavIndex(index),
          items: const[
            BottomNavigationBarItem(
              icon: Icon(Icons.airplane_ticket),
              label: "노랑",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_tree),
              label: "초록",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.abc_sharp),
              label: "파랑",
            ),
          ],
        ),
        body: SafeArea(
            child: _items[navIndex]
        ),
      ),
    );
  }
}

class MyApp3 extends StatefulWidget {
  const MyApp3({Key? key}) : super(key: key);

  @override
  State<MyApp3> createState() => _MyApp3State();
}

class _MyApp3State extends State<MyApp3> {

  int navIndex = 0;

  void changeNavIndex(int index){
    setState(() {
      navIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text("나의정보",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: null,),
          actions: const[
            IconButton(icon: Icon(Icons.search), onPressed: null),
            IconButton(icon: Icon(Icons.menu), onPressed: null),
          ],
        ),
        body: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                  child: Icon(Icons.person,size: 100,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children:[
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 17),
                        child: Text("신기한 님", style: TextStyle(fontSize: 24),),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 3),
                        child: Text("국민내일배움카드", style: TextStyle(fontSize: 20),),
                      ),
                    ],
                ),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                decoration:  BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 17),
                              child: Text("나의 카드", style: TextStyle(fontSize: 18),),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 0),
                              child: Text("카드발급결정", style: TextStyle(color: Colors.green,fontSize: 20),),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal:0,vertical: 0),
                          margin: EdgeInsets.symmetric(horizontal: 85),
                          child: Icon(Icons.add_card,size: 100,color: Colors.grey,),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal:15,vertical: 0),
                        child: Divider(color: Colors.grey, thickness: 2.0)
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 17),
                              child: Text("나의 상담", style: TextStyle(fontSize: 18),),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 0),
                              child: Text("상담내역 0건", style: TextStyle(color: Colors.green,fontSize: 20),),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal:0,vertical: 0),
                          margin: EdgeInsets.symmetric(horizontal: 85),
                          child: Icon(Icons.chat,size: 100,color: Colors.grey,),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal:15,vertical: 0),
                        child: Divider(color: Colors.grey, thickness: 2.0)
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 17),
                              child: Text("나의 훈련", style: TextStyle(fontSize: 18),),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 0),
                              child: Text("훈련수료 1건", style: TextStyle(color: Colors.green,fontSize: 20),),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal:0,vertical: 0),
                          margin: EdgeInsets.symmetric(horizontal: 85),
                          child: Icon(Icons.card_membership,size: 100,color: Colors.grey,),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal:15,vertical: 0),
                        child: Divider(color: Colors.grey, thickness: 2.0)
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 17),
                              child: Text("나의 관심(훈련)", style: TextStyle(fontSize: 18),),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 0),
                              child: Text("관심훈련 0건", style: TextStyle(color: Colors.green,fontSize: 20),),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal:0,vertical: 0),
                          margin: EdgeInsets.symmetric(horizontal: 80),
                          child: Icon(Icons.bookmark_add,size: 100,color: Colors.grey,),
                        ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal:15,vertical: 0),
                        child: Divider(color: Colors.grey, thickness: 2.0)
                    ),
                  ],
                ),
              ),
            )
          ],

        ),

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: navIndex,
          onTap: changeNavIndex,
          items: const[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "홈",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search_sharp),
              label: "과정검색",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "나의 정보",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notification_add_outlined),
              label: "도움말",
            ),
          ],
        ),
      ),
    );
  }
}
