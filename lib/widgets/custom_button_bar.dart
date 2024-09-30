import 'package:flutter/material.dart';

import '/core/app_export.dart'; // Adjust this import path

enum BottomBarEnum { tf }

// ignore_for_file: must_be_immutable
class CustomBottomBar extends StatefulWidget {
  CustomBottomBar({super.key, this.onChanged});

  Function(BottomBarEnum)? onChanged;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

// ignore_for_file: must_be_immutable
class CustomBottomBarState extends State<CustomBottomBar> {
  int selectedIndex = 0;

  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgIconProfile,
      activeIcon: ImageConstant.imgIconProfile,
      title: "lbl_7".tr, // Using localized string
      type: BottomBarEnum.tf,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIconlyBulkBuy,
      activeIcon: ImageConstant.imgIconlyBulkBuy,
      title: "lbl_7".tr, // Using localized string
      type: BottomBarEnum.tf,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgIconlyBulkChat,
      activeIcon: ImageConstant.imgIconlyBulkChat,
      title: "lbl_7".tr, // Using localized string
      type: BottomBarEnum.tf,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74.0,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(22.h),
        boxShadow: const [
          BoxShadow(
            color: Color(0x195A6CEA),
            spreadRadius: 2.0,
            blurRadius: 2.0,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: SizedBox(
              height: 26.0,
              width: 66.0,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      bottomMenuList[index].title!,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 26.0,
                    child: Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CustomImageView(
                          imagePath: bottomMenuList[index].icon,
                          height: 24.0,
                          width: 24.0,
                          margin: const EdgeInsets.only(right: 4.0),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 12.0,
                            height: 14.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(6.0),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.0,
                              ),
                            ),
                            child: Text(
                              "lb1_7".tr, // Using localized string
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            activeIcon: CustomImageView(
              imagePath: bottomMenuList[index].activeIcon,
              height: 20.0,
              width: 20.0,
            ),
            label: "",
          );
        }),
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            widget.onChanged?.call(bottomMenuList[index].type);
          });
        },
      ),
    );
  }
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;
  String activeIcon;
  String? title;
  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF444444),
      padding: const EdgeInsets.all(10),
      child: const Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
