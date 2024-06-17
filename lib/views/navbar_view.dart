import 'package:flutter/material.dart';
import 'package:praktikum_1/constants/color_constant.dart';
import 'package:praktikum_1/constants/text_style_constant.dart';
import 'package:praktikum_1/views/home_view.dart';
import 'package:praktikum_1/views/portofolio_view.dart';

class GlobalNavBar extends StatefulWidget {
  const GlobalNavBar({super.key});

  @override
  State<GlobalNavBar> createState() => _GlobalNavBarState();
}

class _GlobalNavBarState extends State<GlobalNavBar> {
  int _selectedIndex = 0;

  static final List<Widget> pages = [
    const HomeView(),
    const PortofolioView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.primaryBlue,
      body: pages[_selectedIndex],
      bottomNavigationBar: navbarWidget(),
    );
  }

  Widget navbarWidget() {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(15),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedLabelStyle: TextStyleConstant.poppins_medium
              .copyWith(fontSize: 10, color: const Color(0xff3366FF)),
          unselectedLabelStyle: TextStyleConstant.poppins_medium
              .copyWith(fontSize: 10, color: const Color(0xffABABAB)),
          selectedItemColor: const Color(0xff3366FF),
          unselectedItemColor: const Color(0xffABABAB),
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _selectedIndex == 0
                    ? const Color(0xff3366FF)
                    : const Color(0xffABABAB),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.workspace_premium,
                color: _selectedIndex == 1
                    ? const Color(0xff3366FF)
                    : const Color(0xffABABAB),
              ),
              label: 'Portfolio',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.support_agent,
                color: _selectedIndex == 2
                    ? const Color(0xff3366FF)
                    : const Color(0xffABABAB),
              ),
              label: 'Support',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: _selectedIndex == 3
                    ? const Color(0xff3366FF)
                    : const Color(0xffABABAB),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
