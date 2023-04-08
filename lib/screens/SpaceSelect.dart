import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:seegong_flutter/screens/Appbar.dart';
import 'package:seegong_flutter/screens/NavigationMenu.dart';
import 'package:seegong_flutter/screens/SpaceListScreen.dart';
import 'package:seegong_flutter/viewModel/LoginViewModel.dart';
import 'package:seegong_flutter/viewModel/SpaceViewModel.dart';

class SpaceSelect extends StatelessWidget {
  const SpaceSelect({super.key});
  static final routename ='/SpaceSelect';

  @override
  Widget build(BuildContext context) {
    final currentUserController = Get.put(CurrentUserViewModel());

    return GetBuilder<SpaceViewModel>(
      init: new SpaceViewModel(),
      builder: (_) {
        return Scaffold(
          appBar: Appbarseegong,
          drawer: NavigationMenu(),
          // body: ShowSpaceSelectListView(context),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Text("${currentUserController.user.value.userName}님\n어떤 장소를 예약해볼까요?", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              ),
              Container(
                child: Expanded(
                  child: GridView.count(
                    // 가로
                    crossAxisCount: 4,
                    // 전체
                    children: List.generate(_.spaceItemList.icon_list.length, (index) {
                      return Center(
                        child: Column(
                          children: [
                            IconButton(
                              icon: SvgPicture.asset(
                                  "images/icons/${_.spaceItemList.icon_list[index]}",
                              ),
                              iconSize: 54,
                              onPressed: () {
                                print("Item $index pressed");
                                Navigator.pushNamed(context, SpaceListScreen.routename);
                                //바꿔야 함
                              },
                            ),
                            Text(
                                "${_.spaceItemList.name_list[index]}",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}