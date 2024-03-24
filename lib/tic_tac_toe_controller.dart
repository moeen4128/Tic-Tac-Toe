import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Controller extends GetxController{
  Rx<Color>  baseColor =  Rx(const Color(0xFFF2F2F2));
  Rx<int> O_wins = 0.obs;
  Rx<int> X_wins = 0.obs;
  Rx<int> filled = 0.obs;
  RxBool flag= false.obs;
  Rx<String> currentPlayer = 'O'.obs;
  RxList highlightIndex = [].obs;
  RxList value = ['*', '*', '*', '*', '*', '*', '*', '*', '*'].obs;

  checkPlace(v1, v2, v3) {
    if (value[v1] != '*' && value[v1] == value[v2] && value[v1] == value[v3])
    {
      highlightIndex.addAll([v1, v2, v3]);
      return true;
    }
    return false;
  }

  checkWin() {
    if (checkPlace(0,1,2) || checkPlace(3, 4, 5) || checkPlace(6, 7, 8)) {
      flag.value= true;
      return true;
    } else if (checkPlace(0, 3, 6) ||
        checkPlace(1, 4, 7) ||
        checkPlace(2, 5, 8)) {
      flag.value= true;
      return true;
    } else if (checkPlace(2, 4, 6) || checkPlace(0, 4, 8)) {
      flag.value= true;
      return true;
    } else {
      return false;
    }
  }
  reset() {
    currentPlayer.value = 'O';
    filled.value = 0;
    value = ['*', '*', '*', '*', '*', '*', '*', '*', '*'].obs;
    highlightIndex.clear();
    flag.value=false;
  }

  setvalue(index) {
    value[index] = currentPlayer.value;

    var result = checkWin();
    if (result) {
      Get.snackbar('Yah PLayer : ${currentPlayer.value}', 'You won this round',
          icon: const Icon(Icons.celebration_rounded),
          shouldIconPulse: true,
          snackPosition: SnackPosition.BOTTOM);
      currentPlayer.value == 'O' ? O_wins.value += 1 : X_wins.value += 1;
      Future.delayed(
        const Duration(milliseconds: 3500),
            () {
          reset();
        },
      );
    } else {
      filled.value += 1;
      currentPlayer.value=currentPlayer.value=='O'?'X':'O';
      if (filled.value == 9) {
        Get.snackbar('Round Draw', 'Statr new one',
            icon: const Icon(Icons.restart_alt_rounded));
        reset();
      }
    }
  }
}