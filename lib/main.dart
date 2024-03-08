import 'package:flutter/material.dart';
import 'package:mradithyan_motionintern_challange/pages/change_pass_page.dart';
import 'package:mradithyan_motionintern_challange/pages/change_profile_page.dart';
// import 'package:mradithyan_motionintern_challange/pages/produk.dart';
import 'package:mradithyan_motionintern_challange/pages/profile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/profilePage': (context) => Profile(),
        '/changePass': (context) => ChangePassPage(),
        '/editProfile': (context) => EditProfile(),
      },
      home: Profile(),
    );
  }
}
