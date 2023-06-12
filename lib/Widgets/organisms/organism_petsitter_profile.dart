import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pet_sitting_project/Constants/constants_colors.dart';
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
import 'dart:math';

class OrganismPetSitterProfile extends StatefulWidget {
  const OrganismPetSitterProfile({super.key});

  @override
  State<OrganismPetSitterProfile> createState() =>
      OrganismPetSitterProfileState();
}

class OrganismPetSitterProfileState extends State<OrganismPetSitterProfile>
    with SingleTickerProviderStateMixin {
  final _space = const SizedBox(
    height: 30,
  );
  bool _zoomed = false;
  Widget _zoomImg = Container();
  double _zoomOpa = 0;

  final List<String> tabNames = ['Posts', 'Reviews'];
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabNames.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _zoom(
      chi: Column(
        children: [
          _infoSection,
          _tab,
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
    return Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(right: 15, top: 15), child: _settings),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _profileData,
              profileText(
                text:
                    "Introducing Joshua, a devoted pet sitter with a deep passion for his four-legged companions.",
              ),
            ],
          ),
        ]);
  }

  Widget get _settings {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, ConstantRoutes.message),
      child: const Icon(
        Icons.message,
        color: ConstantColors.primary,
        size: 30,
      ),
    );
  }

  Widget get _profileData {
    double rating = 4.5;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 57,
          backgroundImage: AssetImage("assets/images/homem3.jpg"),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Joshua Turner",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "3456 Followers",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Rating: ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.amber,
            ),
            Text(
              rating.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget get _tab {
    return Expanded(
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: tabNames.map((String name) => Tab(text: name)).toList(),
            labelColor:
                Colors.black, // Set the color for selected/active tab text
            unselectedLabelColor:
                Colors.grey, // Set the color for unselected/inactive tab text
            indicatorColor: ConstantColors.primary,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // Replace with your tab content widgets
                Center(child: _gallery),
                Center(child: _review),
              ],
            ),
          ),
        ],
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

  Widget get _review {
    final Random random = Random();
    final List<String> names = [
      'John Doe',
      'Jane Smith',
      'Michael Johnson',
      'Emily Davis',
      'David Wilson',
    ];

    final List<String> comments = [
      'Great pet sitter! Highly recommend.',
      'Very reliable and professional.',
      'Took excellent care of my pet. Will book again.',
      'Friendly and attentive towards animals.',
      'Fantastic experience. Thank you!',
    ];

    final List<String> avatarImages = [
      'assets/images/homem1.jpg',
      'assets/images/homem2.jpg',
      'assets/images/mulher2.jpg',
      'assets/images/mulher3.jpg',
      'assets/images/mulher1.jpg',
    ];

    final List<String> commentImages = [
      'assets/images/comment1.jpg',
      'assets/images/comment2.jpg',
      'assets/images/comment3.jpg',
      'assets/images/comment4.jpg',
      'assets/images/comment5.jpg',
    ];

    int currentIndex = 0;

    String getNextName() {
      if (currentIndex >= names.length) {
        currentIndex = 0;
        names.shuffle();
      }
      return names[currentIndex++];
    }

    String getNextComment() {
      if (currentIndex >= comments.length) {
        currentIndex = 0;
        comments.shuffle();
      }
      return comments[currentIndex++];
    }

    String getNextAvatarImage() {
      if (currentIndex >= avatarImages.length) {
        currentIndex = 0;
        avatarImages.shuffle();
      }
      return avatarImages[currentIndex++];
    }

    String getNextCommentImage() {
      if (currentIndex >= commentImages.length) {
        currentIndex = 0;
        commentImages.shuffle();
      }
      return commentImages[currentIndex++];
    }

    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final int rating = random.nextInt(6); // Random rating from 1 to 5
              final String name = getNextName();
              final String comment = getNextComment();
              final String avatarImage = getNextAvatarImage();
              final String commentImage = getNextCommentImage();
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Card(
                  color: Color.fromARGB(255, 235, 235, 235),
                  elevation: 2,
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(avatarImage),
                    ),
                    title: Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            SizedBox(width: 4),
                            Text(rating.toStringAsFixed(1),
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          comment,
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      // Handle onTap event
                    },
                  ),
                ),
              );
            },
            childCount: 5,
          ),
        ),
      ],
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
                    {_onZoom(const ImageZoom(img: "assets/images/persa.jpg"))},
                child: ImageInProfile(image: "assets/images/persa.jpg")),
            GestureDetector(
                onLongPress: () => _onZoom(
                    const ImageZoom(img: "assets/images/pastorAlemao2.jpg")),
                child:
                    ImageInProfile(image: "assets/images/pastorAlemao2.jpg")),
            GestureDetector(
                onLongPress: () => {
                      _onZoom(const ImageZoom(
                          img: "assets/images/pastorAlemao3.jpg"))
                    },
                child:
                    ImageInProfile(image: "assets/images/pastorAlemao3.jpg")),
            GestureDetector(
                onLongPress: () => {
                      _onZoom(const ImageZoom(
                          img: "assets/images/pastorAlemao4.jpg"))
                    },
                child:
                    ImageInProfile(image: "assets/images/pastorAlemao4.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(const ImageZoom(img: "assets/images/jack.jpg"))},
                child: ImageInProfile(image: "assets/images/jack.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(const ImageZoom(img: "assets/images/jack2.jpg"))},
                child: ImageInProfile(image: "assets/images/jack2.jpg")),
            GestureDetector(
                onLongPress: () => {
                      _onZoom(const ImageZoom(img: "assets/images/dogpark.jpg"))
                    },
                child: ImageInProfile(image: "assets/images/dogpark.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(const ImageZoom(img: "assets/images/dogEat.jpg"))},
                child: ImageInProfile(image: "assets/images/dogEat.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/saoBernardo.jpg"))},
                child: ImageInProfile(image: "assets/images/saoBernardo.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/dogLeash.jpg"))},
                child: ImageInProfile(image: "assets/images/dogLeash.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/puppy.jpg"))},
                child: ImageInProfile(image: "assets/images/puppy.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/puppy2.jpg"))},
                child: ImageInProfile(image: "assets/images/puppy2.jpg")),
            GestureDetector(
                onLongPress: () =>
                    {_onZoom(ImageZoom(img: "assets/images/pastorAlemao.jpg"))},
                child: ImageInProfile(image: "assets/images/pastorAlemao.jpg")),

            // Other images...
          ],
        ),
      ).frosted(),
    );
  }

  Widget get _settingsButton {
    return Button(
      label: "Settings",
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
