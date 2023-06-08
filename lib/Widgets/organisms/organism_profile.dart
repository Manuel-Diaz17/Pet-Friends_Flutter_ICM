import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_sitting_project/Constants/constants_colors.dart';
import 'package:pet_sitting_project/Widgets/atoms/SettingsBloc.dart';
import 'package:pet_sitting_project/Widgets/atoms/cameraButton.dart';
import 'package:pet_sitting_project/Widgets/atoms/image_in_profile.dart';
import 'package:pet_sitting_project/Widgets/atoms/image_in_profile_zoom.dart';
import 'package:pet_sitting_project/Widgets/atoms/profileText.dart';
import 'package:pet_sitting_project/Widgets/molecules/molecule_avatar.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';
import 'package:pet_sitting_project/widgets/molecules/molecule_store_item.dart';
import 'package:pet_sitting_project/Widgets/molecules/molecule_message_block.dart';
import 'package:blur/blur.dart';
import 'package:pet_sitting_project/widgets/atoms/button.dart';

class OrganismProfile extends StatefulWidget {
  const OrganismProfile({super.key});

  @override
  State<OrganismProfile> createState() => _OrganismProfileState();
}

class _OrganismProfileState extends State<OrganismProfile> {
  final _space = const SizedBox(
    height: 30,
  );
  bool _zoomed = false;
  Widget _zoomImg = Container();
  double _zoomOpa = 0;

  @override
  Widget build(BuildContext context) {
    return _zoom(
      chi: Column(
        children: [
          _infoSection,
          _divider, //Space Container
          _gallery,
        ],
      ),
    );
  }

  _onZoom(Widget wi) {
    setState(() {
      _zoomed = !_zoomed;
      _zoomImg = wi;
    });
  }

  Widget _zoom({required Column chi}) => _zoomed
      ? GestureDetector(
          onTap: () => _onZoom(Container()),
          child: Blur(
            blurColor: Colors.transparent,
            colorOpacity: 0.5,
            blur: 5,
            overlay: _zoomImg,
            child: chi,
          ),
        )
      : Container(child: chi);

  Widget get _infoSection {
    return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
      Container(margin: EdgeInsets.only(right: 15, top: 15), child: _settings),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _profileData,
          profileText(
            text:
                "Introducing Scott, a devoted dog owner with a deep passion for his four-legged companions.",
          ),
        ],
      ),
      _camera,
    ]);
  }

  Widget get _settings {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<void>(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            builder: (BuildContext context) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Wrap(
                  direction: Axis.vertical,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 10,
                  spacing: 10,
                  children: [
                    _settingsButton,
                    _signOutButton,
                  ],
                ),
              );
            });
      },
      child: const Icon(
        Icons.edit,
        color: ConstantColors.primary,
        size: 30,
      ),
    );
  }

  Widget get _profileData {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 57,
          backgroundImage: AssetImage("assets/images/homem5.jpg"),
        ),
        SizedBox(
          height: 5,
        ),
        BlocBuilder<SettingsBloc, String>(builder: (context, count) {
          return Center(
              child: Text(count,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )));
        }),
        Text("876 Followers",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }

  Widget get _camera {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 15),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: const BoxDecoration(
            color: ConstantColors.primary,
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: const Icon(
          Icons.photo_camera,
          color: ConstantColors.white,
        ),
      ),
    );
  }

  Widget get _divider {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      color: ConstantColors.gray,
      height: 2,
    );
  }

  Widget get _gallery {
    return Expanded(
      child: SingleChildScrollView(
        child: GridView.count(
          primary: false,
          padding: const EdgeInsets.all(2),
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 3,
          shrinkWrap: true,
          children: [
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pet1.jpg"))},
                child: ImageInProfile(image: "assets/images/pet1.jpg")),
            GestureDetector(
                onLongPress: () =>
                    _onZoom(ImageZoom(img: "assets/images/pet2.jpg.jpg")),
                child: ImageInProfile(image: "assets/images/pet2.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pet3.jpg"))},
                child: ImageInProfile(image: "assets/images/pet3.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pet4.jpg"))},
                child: ImageInProfile(image: "assets/images/pet4.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pet5.jpg"))},
                child: ImageInProfile(image: "assets/images/pet5.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pet6.jpg"))},
                child: ImageInProfile(image: "assets/images/pet6.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pet7.jpg"))},
                child: ImageInProfile(image: "assets/images/pet7.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pet8.jpg"))},
                child: ImageInProfile(image: "assets/images/pet8.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pet9.jpg"))},
                child: ImageInProfile(image: "assets/images/pet9.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pet10.jpg"))},
                child: ImageInProfile(image: "assets/images/pet10.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pet11.jpg"))},
                child: ImageInProfile(image: "assets/images/pet11.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pet12.jpg"))},
                child: ImageInProfile(image: "assets/images/pet12.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pet13.jpg"))},
                child: ImageInProfile(image: "assets/images/pet13.jpg")),

            // Other images...
          ],
        ),
      ).frosted(),
    );
  }

  Widget get _settingsButton {
    return Button(
      label: "Edit Profile",
      onTap: () => Navigator.pushNamed(context, ConstantRoutes.signUp),
      width: 250,
    );
  }

  Widget get _signOutButton {
    return Button(
      label: "Sign out",
      onTap: () {
        Navigator.pushNamed(context, ConstantRoutes.welcome);
      },
      width: 250,
      color: ConstantColors.white,
      textColor: ConstantColors.primary,
      borderColor: ConstantColors.primary,
    );
  }
}
