import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reading_complex_api/controller/load_br_ba_character_controller.dart';
import 'package:reading_complex_api/view/show_data.dart';

class HomePage extends StatelessWidget {
  //for calling loaddata function here we have to create an object

  LoadBreakingBadCharacterController loadBreakingBadCharacterController =
      Get.put(LoadBreakingBadCharacterController());
  //now we can aacess all the controller function here using loadBreakingBadCharacterController
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                loadBreakingBadCharacterController.loadData();
                Get.to(() => ShowData());
              },
              child: Text('Load Data')),
        ]),
      ),
    );
  }
}
