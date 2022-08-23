import 'package:flutter/material.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);

  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Text('BodyHomePage'),
      ),
    );
  }
}


// class MyHomePage extends StatefulWidget {
//   static const id = '/';
//
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: tabBar.length, vsync: this);
//
//     // будем делать каждый раз перестроение, когда виджет меняетя
//     tabController.addListener(() {
//       print(tabController.index.toString());
//       setState(() {
//         currentTabIndex.value = tabController.index;
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: MyLeftDrawer.openLeftDrawer(),
//         actions: [
//           MyEndDrawer.openEndDrawer(),
//         ],
//       ),
//       endDrawer: MyEndDrawer(),
//       drawer: MyLeftDrawer(),
//       body: TabBarView(
//         controller: tabController,
//         children: [
//           //перечисляем страницы, в соответсвии с количеством табов
//           Container(
//             alignment: Alignment.center,
//             color: Colors.green,
//             child: Text('1'),
//           ),
//           Container(
//             alignment: Alignment.center,
//             color: Colors.yellow,
//             child: Text('2'),
//
//             // Text(_tabBar[_currentTabIndex].title),
//           ),
//           Container(
//             alignment: Alignment.center,
//             color: Colors.purple,
//             child: Text('3'),
//           ),
//           Container(
//             alignment: Alignment.center,
//             color: Colors.purple,
//             child: Text('4'),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         iconSize: 20,
//         fixedColor: Theme.of(context).primaryColor,
//         unselectedItemColor: Colors.blueGrey,
//         type: BottomNavigationBarType.fixed,
//         items: [
//           for (final item in tabBar)
//             BottomNavigationBarItem(icon: item.icon, label: item.title)
//         ],
//         onTap: (index) {
//           setState(() {
//             tabController.index = index;
//             currentTabIndex.value = index;
//           });
//         },
//         currentIndex: currentTabIndex.value,
//       ),
//     );
//   }
// }
