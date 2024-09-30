import 'package:flutter/material.dart';
import 'package:my_food_app/core/app_export.dart';
import 'package:my_food_app/screens/upload_photo_screen/bloc/upload_photo_bloc.dart';

import '../models/listfrom_item_model.dart';

class ListfromItemWidget extends StatelessWidget {
  final ListfromItemModel listfromItemModelObj;

  const ListfromItemWidget(this.listfromItemModelObj, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (listfromItemModelObj.orderdetails == "From Gallery") {
          context.read<UploadPhotoBloc>().add(SelectGalleryImageEvent());
        } else if (listfromItemModelObj.orderdetails == "Take Photo") {
          context.read<UploadPhotoBloc>().add(TakePhotoEvent());
        }
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(22),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 2,
              blurRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              listfromItemModelObj.orderdetails ?? 'No details available',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Image.asset(
              listfromItemModelObj.fromGallery ?? 'assets/images/default.png',
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
