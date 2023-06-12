import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Widgets/organisms/organism_profile.dart';
import 'package:pet_sitting_project/Widgets/pages/page_requests.dart';
import 'package:pet_sitting_project/constants/constants_colors.dart';
import 'package:pet_sitting_project/widgets/pages/page_home.dart';
import 'package:pet_sitting_project/widgets/pages/page_pet_sitters.dart';
import 'package:pet_sitting_project/widgets/pages/page_profile.dart';
import 'package:pet_sitting_project/widgets/pages/page_store.dart';

class TemplatePlatform extends StatefulWidget {
  const TemplatePlatform({
    super.key,
    this.index,
  });

  final int? index;
  @override
  State<TemplatePlatform> createState() => _TemplatePlatformState();
}

class _TemplatePlatformState extends State<TemplatePlatform> {
  int _currentIndex = 0;
  List<Widget> body = const [
    PageHome(),
    PagePetSitters(),
    PageRequests(),
    PageStore(),
    PageProfile(),
  ];

  @override
  void initState() {
    _currentIndex = widget.index ?? 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: ConstantColors.primary,
        ),
        child: BottomNavigationBar(
          onTap: (int newIndex) {
            setState(
              () {
                _currentIndex = newIndex;
              },
            );
          },
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          unselectedItemColor: ConstantColors.white,
          selectedItemColor: ConstantColors.secondary,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Discover",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tour),
              label: "Requests",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: "Store",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
        ),
      ),
    );
  }
}
