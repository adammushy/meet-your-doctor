// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meet_your_doctor/constants/app_constants.dart';

class ProfileImageWidget extends StatelessWidget {
  final imagePath;
  final bool isEdit;
  final VoidCallback onClicked;
  final VoidCallback onTapped;

  final String imageFromType;

  const ProfileImageWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
    required this.onTapped,

    required this.imageFromType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          ClipOval(
            child: Material(
              color: Colors.transparent,
              child: imageFromType == AppConstants.imageFromAsset
                  ? Ink.image(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                      width: 128,
                      height: 128,
                      child: InkWell(onTap: onTapped),
                    )
                  : imageFromType == AppConstants.imageFromNetwork
                      ? Ink.image(
                          image: NetworkImage(imagePath),
                          fit: BoxFit.cover,
                          width: 128,
                          height: 128,
                          child: InkWell(onTap: onTapped),
                        )
                      : Ink.image(
                          image: FileImage(imagePath),
                          fit: BoxFit.cover,
                          width: 128,
                          height: 128,
                          child: InkWell(onTap: onTapped),
                        ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: InkWell(
              onTap: onClicked,
              child: GestureDetector(
                  onTap: () {},
                  child: ClipOval(
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      color: color,
                      child: ClipOval(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          color: color,
                          child: isEdit
                              ? InkWell(
                                  onTap: () {},
                                  child: const Icon(
                                    Icons.add_a_photo,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              : InkWell( 
                                onTap: onClicked,
                                child: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                              ),
                        ),
                      ),
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
