import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project_crew/presentation/screen/main/feature/home/home_screen.dart';
import 'package:project_crew/presentation/screen/main/feature/category/category_screen.dart';
import 'package:project_crew/presentation/screen/main/feature/account/user_detail/user_detail_screen.dart';

class MainScreen extends ConsumerStatefulWidget {
  const MainScreen({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  ConsumerState<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends ConsumerState<MainScreen> {
  late int _currentIndex = widget.initialIndex.clamp(0, 2);
  bool _bottomBarVisible = true;
  bool _didResetAfterPush = false;
  bool _didResetOnUpdate = false;

  @override
  void initState() {
    super.initState();
    // Ensure we always land on Home after fresh navigation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      setState(() {
        _currentIndex = 0;
        _bottomBarVisible = true;
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // One-shot reset to Home when this page becomes current after navigation
    final route = ModalRoute.of(context);
    if (!_didResetAfterPush && route != null && route.isCurrent) {
      _didResetAfterPush = true;
      if (_currentIndex != 0) {
        setState(() {
          _currentIndex = 0;
          _bottomBarVisible = true;
        });
      }
    }
  }

  @override
  void didUpdateWidget(covariant MainScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // If this widget was rebuilt after auth flow, ensure initial tab is Home once
    if (!_didResetOnUpdate) {
      _didResetOnUpdate = true;
      if (_currentIndex != 0) {
        _currentIndex = 0;
        _bottomBarVisible = true;
      }
    }
  }

  late final List<Widget> _tabs = <Widget>[
    HomeScreen(
      openAccountTab: () {
        if (_currentIndex == 2) return;
        setState(() {
          _currentIndex = 2;
        });
      },
      setBottomNavVisible: (visible) {
        if (_bottomBarVisible == visible) return;
        setState(() {
          _bottomBarVisible = visible;
        });
      },
    ),
    const CategoryScreen(),
    const UserDetailScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs,
      ),
      bottomNavigationBar: AnimatedSlide(
        duration: const Duration(milliseconds: 200),
        offset: _bottomBarVisible ? Offset.zero : const Offset(0, 1),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _bottomBarVisible ? 1.0 : 0.0,
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (int index) {
              if (_currentIndex == index) return;
              setState(() {
                _currentIndex = index;
              });
            },
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home),
                label: '홈',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category_outlined),
                activeIcon: Icon(Icons.category),
                label: '카테고리',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                activeIcon: Icon(Icons.person),
                label: '내 정보',
              ),
            ],
          ),
        ),
      ),
    );
  }
}


