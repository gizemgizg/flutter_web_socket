import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_example/home/view/home_view.dart';
import 'package:web_socket_example/home/viewmodel/home_viewmodel.dart';

class HomeScreenInit extends StatelessWidget {
  const HomeScreenInit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeViewModel(),
        builder: (_) => const HomeScreen());
  }
}
