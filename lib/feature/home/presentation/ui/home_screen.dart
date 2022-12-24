import 'package:flutter/material.dart';
import 'package:smm_apps/core/utils/Colors.dart';
import 'package:smm_apps/feature/forecast/presentation/ui/forecast_chart_screen.dart';
import 'package:smm_apps/feature/forecast/presentation/ui/forecast_detail_screen.dart';
import 'package:smm_apps/feature/forecast/presentation/ui/main_forecast_screen.dart';
import 'package:smm_apps/feature/product/presentation/ui/search_screen.dart';
import 'package:smm_apps/feature/profile/presentation/ui/profile_main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedNavbar = 0;
  void _changeSelectedNavbar(int index) {
    setState(() {
      selectedNavbar = index;
    });
  }

  final List<Widget> _buildScreen = [
    ForecastDetailScreen(),
    SearchScreen(),
    MainForecastScreen(),
    ProfileMainScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildScreen[selectedNavbar],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor().kOrangeColor,
        unselectedItemColor: AppColor().kGreyColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart_outlined), label: 'Forecast'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
        ],
        currentIndex: selectedNavbar,
        onTap: _changeSelectedNavbar,
        showUnselectedLabels: true,
        showSelectedLabels: true,
      ),
    );
  }
}
