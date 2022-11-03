import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:reading_complex_api/model/breakin_bad_data_model/braking_bad_data_list.dart';
import 'package:reading_complex_api/model/breakin_bad_data_model/breakin_bad_data_model.dart';
import 'package:reading_complex_api/view/show_data.dart';

class LoadBreakingBadCharacterController extends GetxController {
  //now this obs variable cheks data is loaded or not
  RxBool isdataLoadingcompleated = false.obs;
  Future<void> loadData() async {
    //import http to get api response
    var response = await http.get(Uri.parse(
        'https://www.breakingbadapi.com/api/characters?limit=10&offset=10'));
    //printing response body
    // print(response.body);
    //decoding json data with validation
    if (response.statusCode == 200) {
      var responseData = jsonDecode(response.body);

      //* BreakingBadDataList jo class hai uske andar jo variable  tha jiska  BreakinBadDataModel  hai use list assign kiya gya hai jo response data hai use BreakinBadDataModel me map kr diya fir use list me conver kr diya
      //NOW brakingBadCharacterList ISME SARI VALUES hai jobhi api se aarhi hai

      BreakingBadDataList.brakingBadCharacterList = List.from(responseData)
          .map((e) => BreakinBadDataModel.fromMap(e))
          .toList();
      //after loading make its value false kr dega
      isdataLoadingcompleated.value = true;
      //after that go to shoedata page
      // Get.to(() =>  ShowData());

    } else {
      Get.snackbar('Error', ' Error while comunicating with API');
    }
  }
}
