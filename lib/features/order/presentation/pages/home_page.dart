import 'package:flutter/material.dart';
import 'package:order_delivery/core/util/functions/functions.dart';
import 'package:order_delivery/features/auth/domain/enitities/user_entity.dart';
import 'package:order_delivery/features/order/presentation/pages/feed_page.dart';
import 'package:order_delivery/features/order/presentation/pages/settings_page.dart';

class HomePage extends StatefulWidget {
  final UserEntity user ;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _navbarIndex = 0;
  @override
  Widget build(BuildContext context) {
  //  String token = widget.user.token ;
    return SafeArea(
      child: Scaffold(
            appBar: homeAppBar(context),
              body: _appPages().elementAt(_navbarIndex),
              bottomNavigationBar: _buildBottomNavBar()),
    );
  }

  List<Widget> _appPages() {
    UserEntity user = widget.user ;
    return <Widget>[FeedPage(user : user), const SettingsPage()];
  }

  Widget _buildBottomNavBar() {
    return BottomNavigationBar(
      currentIndex: _navbarIndex,
      onTap: (value) => _changeNavbarIndex(value),
      items: _buildNavbarItems(),
      elevation: 1,
      selectedLabelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Theme.of(context).colorScheme.onTertiary),
      unselectedLabelStyle: TextStyle(
          fontSize: 12,
          color: Theme.of(context).colorScheme.secondary),
      selectedIconTheme:
          IconThemeData(color: Theme.of(context).colorScheme.onTertiary, size: 30),
      unselectedIconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.secondary,
          size: 20),
    );
  }

  void _changeNavbarIndex(int value) {
    setState(() {
      _navbarIndex = value;
    });
  }

  List<BottomNavigationBarItem> _buildNavbarItems() {
    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(150),
        icon: Icon(
          Icons.home,
          color: Theme.of(context).colorScheme.secondary,
        ),
        label: 'Home',
      ),
      // BottomNavigationBarItem(
      //   backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(150),
      //   icon: Icon(
      //     Icons.production_quantity_limits ,
      //     color: Theme.of(context).colorScheme.secondary,
      //   ),
      //   label: 'Orders',
      // ),
      BottomNavigationBarItem(
        backgroundColor: Theme.of(context).colorScheme.surface.withAlpha(150),
        icon: Icon(Icons.settings,
            color: Theme.of(context).colorScheme.secondary),
        label: 'Settings',
      ),
    ];
  }

}


