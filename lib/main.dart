//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_sitting_project/Widgets/organisms/organism_profile.dart';
import 'package:pet_sitting_project/Widgets/pages/page.settings.dart';
import 'package:pet_sitting_project/Widgets/pages/page_petsitter_profile.dart';
import 'package:pet_sitting_project/Widgets/pages/page_requests.dart';
import 'package:pet_sitting_project/Widgets/pages/page_track_route.dart';

import 'package:pet_sitting_project/bloc/userBloc.dart';
import 'package:pet_sitting_project/Widgets/pages/page_qrcode.dart';
import 'package:pet_sitting_project/Widgets/pages/page_request_details.dart';
import 'package:pet_sitting_project/Widgets/pages/page_tour.dart';
import 'package:pet_sitting_project/constants/constant_routes.dart';
import 'package:pet_sitting_project/widgets/pages/page_profile.dart';
import 'package:pet_sitting_project/Widgets/pages/page_sign_up2.dart';
import 'package:pet_sitting_project/widgets/pages/page_message.dart';
import 'package:pet_sitting_project/widgets/pages/page_messages.dart';
import 'package:pet_sitting_project/widgets/pages/page_sign_in.dart';
import 'package:pet_sitting_project/widgets/pages/page_sign_up.dart';
import 'package:pet_sitting_project/widgets/pages/page_user_logged.dart';
import 'package:pet_sitting_project/widgets/pages/page_welcome.dart';
import 'package:pet_sitting_project/widgets/templates/template_platform.dart';
import 'package:pet_sitting_project/Widgets/atoms/SettingsBloc.dart';
import 'package:pet_sitting_project/Widgets/atoms/CartBloc.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
            create: (BuildContext context) => SettingsBloc()),
        BlocProvider<CartBloc>(create: (BuildContext context) => CartBloc()),
        BlocProvider(create: (BuildContext context) => UserBloc()),
      ],
      child: const MaterialApp(
          title: 'PetSitting',
          debugShowCheckedModeBanner: false,
          home: App())));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Sitting App',
      initialRoute: ConstantRoutes.welcome,
      routes: {
        ConstantRoutes.welcome: (context) => const PageWelcome(),
        ConstantRoutes.signIn: (context) => const PageSignIn(),
        ConstantRoutes.signUp: (context) => const PageSignUp(),
        ConstantRoutes.logged: (context) => const PageUserLogged(),
        ConstantRoutes.message: (context) => const PageMessage(),
        ConstantRoutes.signUp2: (context) => const PageSignUp2(),
        ConstantRoutes.profile: (context) => const PageProfile(),
        ConstantRoutes.petSitterProfile: (context) =>
            const PagePetSitterProfile(),
        ConstantRoutes.messages: (context) => const PageMessages(),
        ConstantRoutes.petSitters: (context) => const TemplatePlatform(
              index: 1,
            ),
        ConstantRoutes.requests: (context) => const TemplatePlatform(index: 2),
        ConstantRoutes.requestDetails: (context) => const PageRequestDetails(),
        ConstantRoutes.qrCode: (context) => const PageQrCode(),
        ConstantRoutes.tour: (context) => const PageTour(),
        ConstantRoutes.trackRoute: (context) => const PageTrackRoute(),
        ConstantRoutes.settings: (context) => const PageSettings()
      },
    );
  }
}
