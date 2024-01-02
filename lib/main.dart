import 'package:flutter/material.dart';
import 'package:orm_image_search_ver1/presenter/main_screen.dart';
import 'package:orm_image_search_ver1/presenter/main_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '오름캠프 이미지 검색 Ver1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
      create: (_) => MainViewModel(),
      child: const MainScreen()),
    );
  }
}
