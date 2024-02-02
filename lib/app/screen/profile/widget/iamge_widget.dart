import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../../app.dart';

class ImageWidget extends StatelessWidget {
  final bool editable;
  const ImageWidget({super.key, this.editable = false});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    return GetX<ProfileController>(
      init: ProfileController(),
      builder: (ec) {
        return Center(
          child: Stack(
            children: [
              buildCircle(child: buildImg(ec), color: AppColors.mainPrimaryColor, all: 0),
              Positioned(
                bottom: 0,
                right: 4,
                child: buildEditorIcon(color),
              )
            ],
          ),
        );
      },
    );
  }

  GestureDetector buildImg(ProfileController pc) {
    return GestureDetector(
      onTap: () {
        if (editable == true) {
          pc.getImage(ImageSource.gallery);
        }
      },
      child: pc.state.isLoading.value
          ? Image.asset(
              width: 130,
              height: 130,
              'assets/images/profile.png',
              fit: BoxFit.cover,
            )
          : ValueListenableBuilder(
              valueListenable: pc.state.boxPRofileImgPath.listenable(),
              builder: (BuildContext context, box, Widget? child) {
                return box.isNotEmpty
                    ? ClipOval(
                        child: Material(
                          child: SizedBox(
                            width: 130,
                            height: 130,
                            child: Image.memory(
                              pc.state.imagePathByte!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : Image.asset(
                        width: 130,
                        height: 130,
                        'assets/images/profile.png',
                        fit: BoxFit.cover,
                      );
              },
            ),
    );
  }

  Widget buildEditorIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: Colors.white,
          all: 8,
          child: const Icon(
            Icons.more_horiz,
            size: 20,
            color: AppColors.mainPrimaryColor,
          ),
        ),
      );

  Widget buildCircle({required Widget child, required Color color, required double all}) => ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: child,
        ),
      );
}
