import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:logger/logger.dart';
import 'package:pet_sitting_project/Constants/constants_colors.dart';
import 'package:pet_sitting_project/Widgets/atoms/SettingsBloc.dart';
import 'package:pet_sitting_project/Widgets/atoms/cameraButton.dart';
import 'package:pet_sitting_project/Widgets/atoms/image_in_profile.dart';
import 'package:pet_sitting_project/Widgets/atoms/image_in_profile_zoom.dart';
import 'package:pet_sitting_project/Widgets/atoms/profileText.dart';
import 'package:pet_sitting_project/Widgets/molecules/molecule_avatar.dart';
import 'package:pet_sitting_project/bloc/userBloc.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';
import 'package:pet_sitting_project/entities/petsitter.dart';
import 'package:pet_sitting_project/isar_service.dart';
import 'package:pet_sitting_project/widgets/molecules/molecule_store_item.dart';
import 'package:pet_sitting_project/Widgets/molecules/molecule_message_block.dart';
import 'package:blur/blur.dart';
import 'package:pet_sitting_project/widgets/atoms/button.dart';
import 'package:image_picker_android/image_picker_android.dart';
import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class OrganismProfile extends StatefulWidget {
  const OrganismProfile({super.key});

  @override
  State<OrganismProfile> createState() => _OrganismProfileState();
}

class _OrganismProfileState extends State<OrganismProfile> {
  final _space = const SizedBox(
    height: 30,
  );
  final service = IsarService();
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
      Container(
          margin: const EdgeInsets.only(right: 15, top: 15), child: _settings),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _profileData,
          BlocBuilder<UserBloc, Petsitter>(builder: (context, sitter) {
            return Center(
                child: profileText(
              text: '${sitter.description}',
            ));
          }),
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
    final log = Logger();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircleAvatar(
          radius: 57,
          backgroundImage: AssetImage("assets/images/homem5.jpg"),
        ),
        const SizedBox(
          height: 5,
        ),
        BlocBuilder<UserBloc, Petsitter>(builder: (context, count) {
          return Center(
              child: Text('${count.fname} ${count.lname}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )));
        }),
        const Text("876 Followers",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            )),
      ],
    );
  }

  Widget get _camera {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        margin: const EdgeInsets.only(right: 15),
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
        child: FutureBuilder<List<List<int>?>>(
          future: _readImagesFromDatabase(),
          builder: (context, AsyncSnapshot<List<List<int>?>> snapshot) {
            if (snapshot.hasError) {
              return Text("Error appeared ${snapshot.error}");
            }

            if (snapshot.hasData) {
              if (snapshot.data == null) return const Text("Nothing to show");

              return GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(2),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 0,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final imageBytes = snapshot.data![index];
                  final imageData = imageBytes != null
                      ? Uint8List.fromList(imageBytes)
                      : null;

                  return GestureDetector(
                      onLongPress: () {
                        _onZoom(ImageZoom(
                          imageData: imageData,
                          image: 'assets/puppy2.jpg',
                        ));
                      },
                      child: ImageInProfile(
                          imageData: imageData, image: 'assets/puppy2.jpg'));
                },
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Widget get _settingsButton {
    return Button(
      label: "Edit Profile",
      onTap: () => Navigator.pushNamed(context, ConstantRoutes.settings),
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

  Future<void> _pickImage() async {
    final ImagePickerPlatform imagePickerImplementation =
        ImagePickerPlatform.instance;
    if (imagePickerImplementation is ImagePickerAndroid) {
      imagePickerImplementation.useAndroidPhotoPicker = true;
    }
    final petsitter = context.read<UserBloc>().state;
    ImagePicker imagePicker = ImagePicker();
    ImagePickerAndroid imagePickerAndroid = ImagePickerAndroid();

    // Show a dialog to choose between camera and gallery
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
            runSpacing: 0,
            spacing: 0,
            children: <Widget>[
              Button(
                label: 'Camera',
                width: 250,
                onTap: () async {
                  Navigator.pop(context); // Close the dialog
                  var status = await Permission.camera.status;
                  PermissionStatus cameraStatus =
                      await Permission.camera.request();
                  PermissionStatus storageStatus =
                      await Permission.storage.request();
                  if (cameraStatus.isGranted && storageStatus.isGranted) {
                    XFile? image = await imagePickerAndroid.getImageFromSource(
                        source: ImageSource.camera);
                    _processImage(image, petsitter.id);
                  }
                },
              ),
              SizedBox(height: 8),
              Button(
                label: 'Gallery',
                width: 250,
                onTap: () async {
                  Navigator.pop(context); // Close the dialog
                  XFile? image =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  _processImage(image, petsitter.id);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _processImage(XFile? image, int petsitterId) async {
    if (image == null) return;

    List<int> imageBytes = await image.readAsBytes();
    service.storeImage(imageBytes, petsitterId);
    setState(() {});
  }

  Future<List<List<byte>?>> _readImagesFromDatabase() async {
    final petsitter = context.read<UserBloc>().state;
    return service.getImagesSitter(petsitter.id);
  }
}
