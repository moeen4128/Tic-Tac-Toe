import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:tic_tac_toe/tic_tac_toe_controller.dart';
class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});

  @override
  Widget build(BuildContext context) {
    final Controller controller = Get.put(Controller());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            const Text(
              "TIC TAC TOE",
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(
                      ()=> Text(
                    "O Wins : ${controller.O_wins}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
                Obx(
                      ()=> Text(
                    "X Wins : ${controller.X_wins}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemCount: 9,
                itemBuilder: (context, index) {
                  return Obx(
                        ()=> GestureDetector(
                      onTap: () {
                        if (controller.value[index] == '*') {
                          controller.setvalue(index);
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ClayContainer(
                          color: controller.baseColor.value,
                          borderRadius: 10,
                          child: Stack(
                            children: [
                              Center(
                                child: Obx(
                                      ()=> Text(
                                    '${controller.value[index]}',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 28),
                                  ),
                                ),
                              ),
                              controller.highlightIndex.contains(index)
                                  ? const SpinKitCircle(
                                color: Colors.redAccent,
                              )
                                  : Container(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Obx(() => controller.flag.value ? ClayContainer(
              height: 65,
              width: 65,
              borderRadius: 60,
              curveType: CurveType.concave,
              child: SpinKitRipple(
                itemBuilder: (context, index) {
                  return const Icon(FontAwesomeIcons.heart);
                },
              ),
            )
                : Container()),
          ],
        ),
      ),
    );
  }

}


