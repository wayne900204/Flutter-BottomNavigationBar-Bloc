import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// own import
import 'account_page.dart';
import 'activity_page.dart';
import 'home_page.dart';
import 'market_page.dart';
import 'package:flutter_bottom_bar_bloc/blocs/bottom_navigation_bar_bloc.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final screens = <Widget>[
    HomeScreen(),
    MarketScreen(),
    ActivityPage(),
    AccountPage(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  ProxyAnimation transitionAnimation = ProxyAnimation(kAlwaysDismissedAnimation);

  BottomNavigationBarBloc _barBloc;
  @override
  void initState() {
    _barBloc = BlocProvider.of<BottomNavigationBarBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) {
        if (state is HomeState) {
          return buildHomepage(currentIndex: state.index);
        }
        if (state is MarketState) {
          return buildHomepage(currentIndex: state.index);
        }
        if (state is ActivityState) {
          return buildHomepage(currentIndex: state.index);
        }
        if (state is AccountState) {
          return buildHomepage(currentIndex: state.index);
        }
        return Container(
          color: Colors.cyan[200],
        );
      },
    );
  }

  Scaffold buildHomepage({int currentIndex}) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: PageStorage(
              bucket: bucket,
              child: screens[currentIndex],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.cyan[300],
        elevation: 5,
        onTap: (index) {
          if (index == 0) {
            return _barBloc..add(LoadHome());
          }
          if (index == 1) {
            return _barBloc..add(LoadMarket());
          }
          if (index == 2) {
            return _barBloc..add(LoadActivity());
          }
          if (index == 3) {
            return _barBloc..add(LoadAccount());
          }
          return _barBloc..add(LoadHome());
        },
        items: [
          _buildTabBarItem(icon: Icon(Icons.home), label: '首頁'),
          _buildTabBarItem(icon: Icon(Icons.home_repair_service_outlined), label: '超市列表'),
          _buildTabBarItem(icon: Icon(Icons.whatshot_outlined), label: '活動'),
          _buildTabBarItem(icon: Icon(Icons.account_circle_sharp), label: '設定')
        ],
      ),
    );
  }

  _buildTabBarItem({final Widget icon, final String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      // ignore: deprecated_member_use
      title: Text(
        label,
        style: TextStyle(fontSize: 14.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
