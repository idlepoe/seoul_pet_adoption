import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'list_screen.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('서울시립동물복지지원센터'),
          bottom: const TabBar(
            tabs: [
              Tab(text: '입양 가능한 동물'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            ListScreen(),
          ],
        ),
      ),
    );
  }
} 