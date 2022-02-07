import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/io.dart';

import 'package:web_socket_example/home/models/model.dart';

class HomeViewModel extends GetxController {
  @override
  void onInit() {
    streamBase();
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    streamBase();
    // TODO: implement onReady
    super.onReady();
  }

  late IOWebSocketChannel channel;
  late  DataModel dataModel = DataModel();

  Future streamBase() async {
    channel = IOWebSocketChannel.connect(
      Uri.parse('wss://api.hollaex.com/stream'),
    );
    channel.sink.add('{"op": "subscribe","args": ["orderbook:xht-usdt"]}');
    // print(channel);
    Future.delayed(const Duration(seconds: 5));
  }

  void modelData(AsyncSnapshot snapshot) {
    Map<String, dynamic> tmp = json.decode(snapshot.data);
    dataModel = DataModel.fromJson(tmp);
  }
}
