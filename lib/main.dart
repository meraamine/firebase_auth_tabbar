import 'package:firebase_auth_provider/auth_provider.dart';
import 'package:firebase_auth_provider/firebase_options.dart';
import 'package:firebase_auth_provider/widgets/tabbar_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (_) => AuthProvider(),
        child: TabbedAuthScreen(),
      ),
    );
  }
}
