import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reading_complex_api/controller/load_br_ba_character_controller.dart';
import 'package:reading_complex_api/model/breakin_bad_data_model/braking_bad_data_list.dart';

class ShowData extends StatelessWidget {
  //accessing the loadingprgreeindicator from controller page
  //kyuki hamara controller ka object bna hua hai toh simply hme get.find ka use krke use get kr lena hai aise getx automatic khoj lega cpic ko
  LoadBreakingBadCharacterController breakingBadCharacterController =
      Get.find();
  ShowData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        //now ise hume obs me rap krna hoga litview.builder ko
        body: Obx(
          // ignore: unrelated_type_equality_checks
          () => breakingBadCharacterController.isdataLoadingcompleated == true
              ? ListView.builder(
                  itemBuilder: (context, index) {
                    //now ise var me jobhi data hai index ka use breaking bad listtile ko pass kr diya ab hum use class me data ko display kra skte hai code bhi clean rahega
                    var breakingBadCharacterData =
                        BreakingBadDataList.brakingBadCharacterList[index];
                    return BreakingBadCharaterTile(
                      breakingBadCharater: breakingBadCharacterData,
                    );
                  },
                  itemCount: BreakingBadDataList.brakingBadCharacterList.length,
                )
              : const Center(child: CircularProgressIndicator()),
        ));
  }
}

//now we are going to create aclass to clean our code and display the data
// jisme hum dat lete hai final breakingBadCharater ab

class BreakingBadCharaterTile extends StatelessWidget {
  //now ab iska use hum uper krenge
  final breakingBadCharater;
  const BreakingBadCharaterTile({super.key, this.breakingBadCharater});

  @override
  Widget build(BuildContext context) {
    //for getting devise size we use mediaquery
    Size size = MediaQuery.of(context).size;
    //now yha hum design krenge data ko breakingBadCharacter.ka use krke hum sari things api ki access kr sakte hai
    //now data thodi der baad aarha hai toh screen blank aar hi hai hum circullarprogree indicator banana hai toh jo variable hmne controller me banaya hai use hum yha access krenge
    //
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            height: size.height * 0.3,
            width: size.width * 0.9,
            decoration: BoxDecoration(
                color: Colors.purpleAccent,
                borderRadius: BorderRadius.circular(20.0)),
            child: Stack(alignment: Alignment.center, children: [
              Positioned(
                  top: 5,
                  left: 10,
                  child: Row(
                    children: [
                      Text(
                        breakingBadCharater.charId.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      Text(
                        breakingBadCharater.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        breakingBadCharater.nickname,
                        style:
                            const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  )),
              Positioned(
                left: 10,
                top: 90,
                child: Column(
                  children: [
                    Text(breakingBadCharater.birthday.toString(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12)),
                    const SizedBox(
                      height: 1,
                    ),
                    SizedBox(
                      width: 100,
                      height: 50,
                      child: ListView.builder(
                        itemCount: breakingBadCharater.occupation.length,
                        itemBuilder: (context, index) {
                          var occupation =
                              breakingBadCharater.occupation[index];
                          return Text('.$occupation',
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12));
                        },
                      ),
                    ),
                    SizedBox(
                        child: Text(
                            breakingBadCharater.appearance.join(" ").toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ))),
                  ],
                ),
              ),
              Positioned(
                right: 30,
                top: 24,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(breakingBadCharater.img),
                    ),
                    SizedBox(
                      height: 15,
                      child: Text(
                        breakingBadCharater.status,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
