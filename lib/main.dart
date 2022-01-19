import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/src/screens/screens.dart';

import 'src/responsive/responsive.dart';
import 'src/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * The following code is for if we want to use a Web application
  // if(kIsWeb){
  //   await Firebase.initializeApp(
  //     options: FirebaseOptions(apiKey: 'AIzaSyCStTzn-frDplnJGBvkgo4Na-NeULNi4go', appId: appId, messagingSenderId: messagingSenderId, projectId: projectId)
  //   );

  // }

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram Clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),
      // home: const Scaffold(
      //   body: ResponsiveLayout(
      //       mobileLayout: MobileScreenLayout(), webLayout: WebScreenLayout()),
      // ),
      home: LoginScreen(),
    );
  }
}
