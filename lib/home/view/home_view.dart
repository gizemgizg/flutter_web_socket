import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:web_socket_example/home/viewmodel/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final homeViewModelput = Get.put(HomeViewModel());
    final homeViewModel = Get.find<HomeViewModel>();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Web Socket Test"),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder(
              stream: homeViewModel.channel.stream,
              builder: (context, snapshot) {
                print("DATA ====>" + snapshot.data.toString());
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  homeViewModel.modelData(snapshot);
                  return ListView.builder(
                      itemCount:
                          homeViewModel.dataModel.data!.bids!.length,
                      itemBuilder: (context, index) {
                        return Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                homeViewModel
                                    .dataModel.data!.bids![index].price
                                    .toString(),
                              ),
                              Text(
                                homeViewModel
                                    .dataModel.data!.bids![index].piece
                                    .toString(),
                              )
                            ]);
                      });
                }
              }),
        ),
        );
  }
}
